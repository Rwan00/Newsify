import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newsify/screens/news_layout.dart';



EasySplashScreen splashScreen() {
  return EasySplashScreen(
    logo: Image.asset("assets/news.png",height: 520,width: 520,),
    logoWidth: 170,
    showLoader: false,
    loaderColor: Colors.white,
    navigator:  const NewsLayout(),
    durationInSeconds: 5,
  );
}