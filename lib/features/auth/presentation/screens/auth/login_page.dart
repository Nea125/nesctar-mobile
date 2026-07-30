import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nestar_mobile/core/constants/app_colors.dart';
import 'package:nestar_mobile/core/constants/app_images.dart';
import 'package:nestar_mobile/core/constants/app_size.dart';
import 'package:nestar_mobile/core/constants/app_space.dart';
import 'package:nestar_mobile/core/constants/app_text.dart';
import 'package:nestar_mobile/core/constants/wigets/app_button.dart';
import 'package:nestar_mobile/core/utils/log.dart';
import 'package:nestar_mobile/core/utils/validator.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/sign_up_page.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/widget/text_input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Successfully"),
        ),
      );

      // TODO:
      // Call your API here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 70),
                    child: Center(
                      child: SvgPicture.asset(AppImages.carrotIcon,
                          width: 60,
                          height: 60,
                          color: const Color.fromARGB(255, 234, 117, 107)),
                    ),
                  ),

                  AppText.heading(
                    "Loging",
                    fontSize: FontSize.extraLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 70),
                    child: AppText.title(
                      "Enter your emails and password",
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  /// Email

                  TextInputWidget(
                      labelText: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => Validator.validationEmail(value)),

                  AppSpace.y(
                    y: 30,
                  ),

                  /// Password

                  TextInputWidget(
                      controller: passwordController,
                      labelText: "Password",
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      validator: (value) =>
                          Validator.validationPassword(value)),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          printMe("Forgot password");
                        },
                        child: AppText.small(
                          "Forgot Password?",
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  /// Login Button

                  SizedBox(
                      width: double.infinity,
                      child: AppButton(
                          text: "Login",
                          onPressed: () {
                            printMe("Login ");
                            // Trigger validation
                            final isValid =
                                _formKey.currentState?.validate() ?? false;
                            if (!isValid) return;
                          })),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignUpPage()));
                          },
                          child: AppText.medium(
                            "Signup",
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
