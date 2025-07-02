import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/viewModel/auth/auth_vm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthVM>().loginPageInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Form(
            key: key,
            child: SingleChildScrollView(
              padding: paddingA,
              child: Container(
                constraints: webWidthConstraint,
                color: white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    h(20),
                    customPaddingH(
                      children: [
                        customText(
                          text: "Log In AppCrew",
                          style: styleTitle24SemiBold,
                        ),
                        h(24),
                        customTextFiled(
                          titleText: "E-mail",
                          hintText: "Enter e-mail",
                          validator: emailValidator(context),
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                        ),
                        h(16),
                        customTextFiled(
                          titleText: "Password",
                          hintText: "Enter password",
                          validator: passwordValidation(),
                          controller: passwordController,
                          obscureText: !context.watch<AuthVM>().isPassVisible,
                          maxLines: 1,
                          suffixIcon: passwordEyeButton(
                            onTap: () {
                              context.read<AuthVM>().setIsPassVisible();
                            },
                            iaOpen: context.watch<AuthVM>().isPassVisible,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                        h(6),
                      ],
                    ),
                    h(22),
                    customButton(
                      isLoading: context.watch<AuthVM>().isLoadingLogin,
                      onTap: () {
                        if (key.currentState!.validate()) {
                          context.read<AuthVM>().onTapLogin(
                                context,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                      name: "Log In",
                    ),
                    h(24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
