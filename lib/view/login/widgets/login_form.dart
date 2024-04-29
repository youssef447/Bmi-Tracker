part of '../login_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController pswdController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    pswdController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      builder: (context, state) {
        final cubit = AuthCubit.get(context);
        return GlassCotnainer(
          height: 388.h,
          width: 345.w,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'LOG IN',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  width: 282.42.w,
                  child: DefaultFormField(
                    controller: emailController,
                    context: context,
                    radius: 22.r,
                    fillColor: Colors.white,
                    type: TextInputType.emailAddress,
                    filled: true,
                    borderNone: true,
                    hintText: 'email',
                    /* validate: (v) {
                          if (v == null || v.isEmpty) {
                            return 'emal cannot be empty';
                          } else {
                            return null;
                          }
                        }, */
                  ),
                ),
                SizedBox(
                  width: 282.42.w,
                  child: DefaultFormField(
                    controller: pswdController,
                    context: context,
                    isPassword: true,
                    radius: 22.r,
                    fillColor: Colors.white,
                    filled: true,
                    borderNone: true,
                    hintText: 'Password',
                    /* validate: (v) {
                          if (v == null || v.isEmpty) {
                            return 'password cannot be empty';
                          } else {
                            return null;
                          }
                        }, */
                  ),
                ),
                state is AuthLoadingState
                    ? const IndicatorBlurLoading()
                    : DefaultButton(
                        raduis: 10.r,
                        child: Text(
                          'LOGIN',
                          style: context.textTheme.titleMedium!.copyWith(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        onClicked: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                              email: emailController.text,
                              password: pswdController.text,
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, AuthStates state) {
        if (state is AuthErrorState) {
          AwesomeDialogUtil.error(
            context: context,
            body: state.errMessage,
            title: 'Failed',
          );
        }
        if (state is AuthSuccessState) {
          context.goAndPop(
            route: AppRoutes.homeScreen,
          );
        }
      },
    );
  }
}
