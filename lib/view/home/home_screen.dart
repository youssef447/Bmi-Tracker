import 'package:bmi_tracker/Model/models/bmi_data.dart';
import 'package:bmi_tracker/Model/repos/bmi_repo.dart';
import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/config/routes/routes.dart';
import 'package:bmi_tracker/view/widgets/indicator_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../../Model/repos/auth_repo.dart';
import '../../config/dependencies/injection.dart';
import '../../core/utils/default_dialog.dart';
import '../widgets/bmi_form.dart';
import '../widgets/humidity_radial_gauge.dart';
part 'widgets/bmi_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loadingLogout = false;
  int limit = 10;
  DocumentSnapshot<Object?>? lastDocument;
  final ScrollController scrollController = ScrollController();
  late Stream<QuerySnapshot<Map<String, dynamic>>> stream;
  bool hasMore = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.offset;
      final delta = maxScroll - currentScroll;

      // Check if user scrolled near the bottom
      if (delta == 0) {
        loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //stream = getPaginatedData();
    final query = FirebaseFirestore.instance
        .collection('bmi data')
        .orderBy('current_time', descending: true)
        
        .withConverter(
          fromFirestore: (snapshot, _) => BmiData.fromJson(snapshot.data()!),
          toFirestore: (bmiData, _) => bmiData.toJson(),
        );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Tracker',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {
            logout();
          },
          icon: loadingLogout
              ? const IndicatorBlurLoading()
              : Icon(
                  Icons.logout,
                ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goTo(
                route: AppRoutes.bmiScreen,
              );
            },
            icon: Image.asset(
              'assets/icon.png',
            ),
          ),
        ],
      ),
      body: /* StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const IndicatorBlurLoading());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error occured...',
                style: context.textTheme.titleMedium,
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No BMI Data Added yet...',
                style: context.textTheme.titleMedium,
              ),
            );
          } else {
            final documents = snapshot.data!.docs;
            hasMore = documents.length == limit;
            if (hasMore) {
              lastDocument = documents.last;
            } else {
              lastDocument = null;
            }

            return ListView.separated(
              controller: scrollController,
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              itemCount: documents.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                //for circular indicator visibility at that length
                if (index == documents.length) {
                  return hasMore
                      ? Center(child: CircularProgressIndicator())
                      : const SizedBox();
                }

                final bmiModel = BmiData.fromJson(
                  documents[index].data(),
                );

                return BmiInfo(
                  model: bmiModel,
                  docId: documents[index].id,
                );
              },
            );
          }
        },
      ), */

          FirestoreListView<BmiData>(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        query: query,
        pageSize: limit,
        emptyBuilder: (context) => const Text(
          'No BMI Data Added yet...',
        ),
        errorBuilder: (context, error, stackTrace) => Text(error.toString()),
        loadingBuilder: (context) {
          return Center(child: const CircularProgressIndicator.adaptive(backgroundColor: Colors.white,));
        },
        itemBuilder:
            (BuildContext context, QueryDocumentSnapshot<BmiData> doc) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: BmiInfo(
              model: doc.data(),
              docId: doc.id,
            ),
          );
        },
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPaginatedData() {
    final query = FirebaseFirestore.instance
        .collection('bmi data')
        .orderBy('current_time', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      return query.startAfterDocument(lastDocument!).snapshots();
    }
    return query.snapshots();
  }

  void loadMore() async {
    if (hasMore) {
      final nextStream = getPaginatedData();

      stream = nextStream;
    }
  }

  logout() async {
    loadingLogout = true;

    final response = await locators.get<AuthRepo>().logout();
    loadingLogout = false;
    response.fold((l) {
      AwesomeDialogUtil.error(
        context: context,
        body: l.errMessage,
        title: 'Error logging out',
      );
    }, (r) {
      if (context.mounted) {
        context.goAndPop(
          route: AppRoutes.loginScreen,
        );
      }
    });
  }
}
