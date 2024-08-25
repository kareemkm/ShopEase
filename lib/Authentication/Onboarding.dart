import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Authentication/LoginScreen.dart';
import 'package:flutter_project/Authentication/SigninScreen.dart';
import 'package:flutter_project/Authentication/WelcomeScreen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  int _currentPage = 0 ;

  final PageController _pageController = PageController(initialPage: 0) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                _currentPage = page ;
              });
            },
            children: [
              WelcomeScreen(),
              SignUpScreen(),
              LoginScreen()
            ],
          ),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index)=> buildDot(index)),
              )
          )
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 10,
        width: _currentPage == index? 20 : 10 ,
        decoration: BoxDecoration(
          color: _currentPage == index? Colors.orange : Colors.grey,
          borderRadius: BorderRadius.circular(5)
        ),

    );
  }

}