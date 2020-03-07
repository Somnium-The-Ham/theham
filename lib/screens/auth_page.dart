import 'package:flutter/material.dart';
import 'package:theham/widget/login_form.dart';
import 'package:theham/widget/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  Widget currentWidget = LogInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: currentWidget),
            _goToSignUpPageBtn(context),
          ],
        ),
      ),
    );
  }

  Positioned _goToSignUpPageBtn(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        shape: Border(top: BorderSide(color: Colors.grey[300])),
        onPressed: (){
          setState(() {
            if(currentWidget is LogInForm) {
              currentWidget = SignUpForm();
            }else{
                currentWidget = LogInForm();
            }
          });
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: const TextStyle(), children: <TextSpan>[
            TextSpan(
                text: (currentWidget is LogInForm)? "더함에 계정을 가지고 있지 않으신가요" : "이미 계정을 가지고 계신가요??",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black54)),
            TextSpan(
                text: (currentWidget is LogInForm)? "회원가입" : "로그인",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.green)),
          ]),
        ),
      ),
    );
  }
}
