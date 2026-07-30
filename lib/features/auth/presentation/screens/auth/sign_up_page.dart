import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nestar_mobile/core/constants/app_images.dart';
import 'package:nestar_mobile/core/constants/app_space.dart';
import 'package:nestar_mobile/core/constants/app_text.dart';
import 'package:nestar_mobile/core/utils/validator.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/widget/text_input_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign Up Successfully"),
        ),
      );

      // TODO: Call API
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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

                AppText.title(
                  "Sign Up",
                  fontSize: 25,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 45),
                  child: AppText.small(
                    "Enter your credentials to continue",
                    fontSize: 15,
                  ),
                ),

                /// Username

                TextInputWidget(
                  labelText: "Username",
                  controller: usernameController,
                  validator: (value) => Validator.validationFullName(value),
                ),

                AppSpace.y(y: 30),

                /// Email

                TextInputWidget(
                  labelText: "Email",
                  controller: emailController,
                  validator: (value) => Validator.validationEmail(value),
                ),

                /// Password
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 24),
                  child: TextInputWidget(
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
                ),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: "By continuing you agree to our ",
                      ),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          color: Color(0xff55B876),
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                      ),
                      TextSpan(
                        text: "Privacy Policy.",
                        style: TextStyle(
                          color: Color(0xff55B876),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff55B876),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Signin",
                        style: TextStyle(
                          color: Color(0xff55B876),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
