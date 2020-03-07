import 'package:flutter/material.dart';
import 'package:theham/widget/login_form.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            LogInForm(),
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
        onPressed: null,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: const TextStyle(), children: <TextSpan>[
            TextSpan(
                text: '더함에 계정이 없으신가요?',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black54)),
            TextSpan(
                text: '  회원가입',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.green)),
          ]),
        ),
      ),
    );
  }
}
