import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nestar_mobile/core/constants/app_images.dart';
import 'package:nestar_mobile/core/constants/app_size.dart';
import 'package:nestar_mobile/core/constants/app_text.dart';
import 'package:nestar_mobile/core/constants/wigets/app_button.dart'
    show AppButton;
import 'package:nestar_mobile/core/utils/extension/context.dart';
import 'package:nestar_mobile/core/utils/log.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/login_social_page.dart';

class AppWelcomePage extends StatefulWidget {
  const AppWelcomePage({super.key});

  @override
  State<AppWelcomePage> createState() => _AppWelcomePageState();
}

class _AppWelcomePageState extends State<AppWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.personImagePNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 250,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImages.carrotIcon,
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: context.smallGap,
                  child: AppText.heading(
                    'Welcome',
                    color: Colors.white,
                    fontSize: FontSize.huge,
                  ),
                ),
                AppText.heading(
                  'to our store',
                  color: Colors.white,
                  fontSize: FontSize.huge,
                ),
                AppText.medium(
                  'Get your groceries in as fast as one hour',
                  color: Colors.white70,
                  fontSize: FontSize.medium,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: AppButton(
              text: 'Get Started',
              onPressed: () {
                printMe("GET STARTED PRESSED");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginSocialPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
