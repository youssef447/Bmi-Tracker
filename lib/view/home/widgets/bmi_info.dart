part of '../home_screen.dart';

class BmiInfo extends StatelessWidget {
  final double? width, height;
  final BmiData model;
  final String docId;

  const BmiInfo({
    super.key,
    this.height,
    this.width,
    required this.model,
    required this.docId,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('M/d/y, hh:mm aa').format(
      model.currentTime.toDate(),
    );
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              bottomLeft: Radius.circular(32.r),
            ),
            onPressed: (context) async {
              await delete(context);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
            onPressed: (context) {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                
                builder: (context) {
                  return BmiForm(
                    edit: true,
                    heightSliderValue: model.height,
                    weightSliderValue: model.weight,
                    ageSliderValue: model.age.toDouble(),
                    docId: docId,
                  );
                },
              );
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.status,
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Bmi Calculation: ${model.score.toStringAsFixed(2)}',
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Age: ${model.age}',
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Height: ${model.height.toInt()} cm',
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Weight: ${model.weight.toInt()} KG',
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Date: $formattedDate',
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BmiRadialGauge(
                needleValue: model.score,
                height: 150.h,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  delete(BuildContext context) async {
    final response = await locators.get<BmiRepo>().delete(docId);
    response.fold((l) {
      AwesomeDialogUtil.error(
        context: context,
        body: l.errMessage,
        title: 'Error Deleting',
      );
    }, (r) {});
  }
}
