
import 'package:flutter/material.dart';
import 'package:online_clothing/resources/strings_manager.dart';

class Routes{
  static const String splashRoute ="/";
  static const String loginRoute ="/login";
  static const String registerRoute ="/register";
  static const String forgotPasswordRoute ="/forgotPassword";
  static const String homeRoute ="/home";
  static const String noBoardingRoute ="/noBoarding";
  static const String detailsRoute ="/storeDetails";

}

class RoutGenerator{
  // static Route<dynamic> getRoute(RouteSettings settings){
  //   switch(settings.name){
  //     case Routes.splashRoute:
  //       return MaterialPageRoute(builder: (_)=>const SplashView());
  //     case Routes.loginRoute:
  //       return MaterialPageRoute(builder: (_)=>const LoginView());
  //     case Routes.registerRoute:
  //       return MaterialPageRoute(builder: (_)=>const RegisterView());
  //     case Routes.forgotPasswordRoute:
  //       return MaterialPageRoute(builder: (_)=>const ForgotPasswordView());
  //     case Routes.homeRoute:
  //       return MaterialPageRoute(builder: (_)=>const HomeView());
  //     case Routes.detailsRoute:
  //       return MaterialPageRoute(builder: (_)=> DetailsView());
  //     // case Routes.noBoardingRoute:
  //     //   return MaterialPageRoute(builder: (_)=>const OnBoardingView());
  //     default:
  //       return  unDefinedRoute();
  //   }
  // }
  static Route<dynamic>  unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title:const Text(AppStrings.noRouteFound)),
      body:const Center(child:  Text(AppStrings.noRouteFound)),
    ));
  }
}