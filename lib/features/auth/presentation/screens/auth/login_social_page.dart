import 'package:flutter/material.dart';
import 'package:nestar_mobile/core/constants/app_colors.dart';
import 'package:nestar_mobile/core/constants/app_images.dart';
import 'package:nestar_mobile/core/constants/app_space.dart';
import 'package:nestar_mobile/core/constants/app_text.dart';
import 'package:nestar_mobile/core/constants/wigets/app_button.dart';
import 'package:nestar_mobile/core/constants/wigets/country_code_widget.dart';
import 'package:nestar_mobile/core/utils/log.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/input_phone_page.dart';

class LoginSocialPage extends StatefulWidget {
  const LoginSocialPage({super.key});

  @override
  State<LoginSocialPage> createState() => _LoginSocialPageState();
}

class _LoginSocialPageState extends State<LoginSocialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.loginImagePNG,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.heading(
                  'Get your groceries',
                  align: TextAlign.start,
                ),
                AppText.heading(
                  'with nectar',
                  align: TextAlign.start,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputPhonePage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CountryPickerWidget(
                        isInputEnabled: false,
                        onChanged: (countryCode, dialCode, phone) {
                          printMe(
                              "Selected country code: $countryCode, dial code: $dialCode");
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: AppText.title(
                      'or connect with social media',
                      align: TextAlign.center,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppButtonWithIcon(
                    text: "Continue with Google",
                    onPressed: () {
                      printMe("Google login");
                    },
                    iconPath: AppImages.googleIcon,
                    backgroundColor: AppColors.highlight,
                  ),
                ),
                AppSpace.y(y: 10),
                AppButtonWithIcon(
                  text: "Continue with Facebook",
                  onPressed: () {
                    printMe("Facebook login");
                  },
                  iconPath: AppImages.facebookIcon,
                  backgroundColor: AppColors.blue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
