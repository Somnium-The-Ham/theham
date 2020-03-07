import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theham/constants/size.dart';
import 'package:theham/main_page.dart';
import 'package:theham/utils/simple_snack_bar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  TextEditingController _pwConstroller = TextEditingController();
  TextEditingController _cpwConstroller = TextEditingController();

  void dispose() {
    _emailConstroller.dispose();
    _pwConstroller.dispose();
    _cpwConstroller.dispose();
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
              TextFormField(
                controller: _cpwConstroller,
                decoration:getTextFieldDecor('Confirm Password'),
                validator: (String value) {
                  if (value.isEmpty || value != _pwConstroller.text) {
                    return '비밀번호를 한번 더 확인해주세요!!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _register;
                  }
                },
                child: Text(
                  "회원 가입",
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

  get _register async {
    final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailConstroller.text, password: _pwConstroller.text);

    final FirebaseUser user = result.user;

    if (user == null){
      final snackbar = SnackBar(content: Text('Please try again later!'),);
      Scaffold.of(context).showSnackBar(snackbar);
    }else{
      Navigator.pop(context);
    }
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
