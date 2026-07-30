import 'package:flutter/material.dart';
import 'package:nestar_mobile/core/constants/app_colors.dart';
import 'package:nestar_mobile/core/constants/app_text.dart';
import 'package:nestar_mobile/core/utils/log.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/login_page.dart';
import 'package:nestar_mobile/features/auth/presentation/screens/auth/login_social_page.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_back_ios),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: AppText.heading("Enter your 4-digit code"),
            ),
            AppText.title(
              "Code",
              fontWeight: FontWeight.normal,
            ),
            TextField(
              controller: pinController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              style: const TextStyle(
                fontSize: 20,
                letterSpacing: 8,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                hintText: "----",
                counterText: "",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.background,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: GestureDetector(
                  onTap: () {
                    printMe("Resent Code ");
                  },
                  child: AppText.title(
                    "Resend Code",
                    color: AppColors.backgroundDo,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          FloatingActionButton(
              backgroundColor: AppColors.backgroundDo,
              shape: const CircleBorder(),
              onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (_)=> const LoginPage()));
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              )),
        ],
      ),
    );
  }
}
