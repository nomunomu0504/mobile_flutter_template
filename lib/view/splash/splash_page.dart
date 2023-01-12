import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/util/view_util.dart';
import 'package:flutter_template/view/router/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends ConsumerState<SplashPage> {
  //================================================
  // constructor
  //================================================
  _SplashPageState();

  //================================================
  // const
  //================================================
  // nothings

  //================================================
  // stored property
  //================================================
  // nothings

  //================================================
  // computed property
  //================================================¥
  // nothings

  //================================================
  // life cycle
  //================================================
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      startApp();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  //================================================
  // event
  //================================================
  void startApp() async {
    try {
      // Go To MainPage
      Navigator.pushReplacementNamed(context, Routes.main);
    } catch (e, stackTrace) {
      await handleError(context, ref, e, stackTrace: stackTrace);

      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
    }
  }

  //================================================
  // private method
  //================================================
  // nothings

  //================================================
  // build widget
  //================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                "assets/images/flutter-original.svg",
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: 0,
            right: 0,
            bottom: 0,
            child: const Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xffBDBDBD),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
