import 'package:flutter/material.dart';
import 'package:nestar_mobile/core/localdb/app_storage.dart';
import 'package:nestar_mobile/welcome/app_welcom.dart';


class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  bool? isFirst;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final first = AppStorage.getFirstLaunch();

    if (first) {
      await AppStorage.setFirstLaunch(isFirstLaunch: false);
    }
    setState(() {
      isFirst = first;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (isFirst == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (isFirst == false) {
      return const AppWelcomePage();
    }
    return const Scaffold(
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}