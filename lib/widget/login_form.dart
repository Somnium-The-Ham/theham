import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';
import 'package:theham/utils/simple_snack_bar.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  TextEditingController _pwConstroller = TextEditingController();

  void dispose() {
    _emailConstroller.dispose();
    _pwConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 6,
              ),
              Image.asset("assets/theham_logo.png", height: 50),
              Spacer(
                flex: 2,
              ),
              TextFormField(
                controller: _emailConstroller,
                decoration:getTextFieldDecor('E-mail'),
                validator: (String value) {
                  if (value.isEmpty || !value.contains("@")) {
                    return '아이디를 확인해주세요!!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _pwConstroller,
                decoration:getTextFieldDecor('Password'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '비밀번호를 확인해주세요!!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "비밀번호를 잊어버렸나요??",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.w600),
                ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {}
                },
                child: Text(
                  "Log-in",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                disabledColor: Colors.green[100],
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton.icon(
                textColor: Colors.blue,
                  onPressed: () {
                  simpleSnackBar(context, 'testing');
                  },
                  icon: ImageIcon(AssetImage("assets_insta/icon/facebook.png")),
                  label: Text("Login with Facebook")),
              Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }



  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5)
      ),
      focusColor: Colors.grey[100],
      filled: true,
    );
  }
}
