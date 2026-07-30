import 'package:flutter/material.dart';
import 'package:nestar_mobile/core/constants/app_colors.dart';
import 'package:nestar_mobile/core/constants/app_text.dart';
import 'package:nestar_mobile/core/constants/wigets/country_code_widget.dart';
import 'package:nestar_mobile/core/utils/log.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/input_otp_page.dart';

class InputPhonePage extends StatefulWidget {
  const InputPhonePage({super.key});

  @override
  State<InputPhonePage> createState() => _InputPhonePageState();
}

class _InputPhonePageState extends State<InputPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: AppText.heading(
                  'Enter your phone number',
                ),
              ),
              AppText.medium('Mobile Number'),
              CountryPickerWidget(
                isInputEnabled: true,
                onChanged: (countryCode, dialCode, phone) {
                  printMe(
                      "Selected country code: $countryCode, dial code: $dialCode, phone: $phone");
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          onPressed: () {
            // printMe("Netxt_Page");
             Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationPage(),
                      ),
                    );
          },
          child: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.white,
          )),
    );
  }
}
