import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/splash_screen_hook.dart';

class SplashPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useAddFrameCallBackSplashScreenHook();
    return Scaffold(
      body: Center(
        child: Text(
          'Transaction Application',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
    );
  }
}
