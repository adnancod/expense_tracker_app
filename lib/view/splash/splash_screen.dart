import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashServices= SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/splash.svg',height: 300,),
          const SizedBox(height: 30,),
          const Center(
            child: Text('Expense Tracker App', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
          ),

        ],
      ),
    );
  }
}
