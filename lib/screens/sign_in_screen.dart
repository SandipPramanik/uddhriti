import 'package:flutter/material.dart';
import 'package:uddhriti/constants.dart';
import 'package:uddhriti/screens/home_screen.dart';
import 'package:uddhriti/screens/sign_up_screen.dart';
import 'package:uddhriti/widgets/textfield.dart';
import 'package:email_validator/email_validator.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        height: size.height,
        width: size.width,
        color: kBackgroundColor,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 20.0,
            right: 20.0,
            bottom: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180.0,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Welcome,",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      "Sign in to continue!",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height:
                    size.height - 260.0 - MediaQuery.of(context).padding.top,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 0.0),
                    children: <Widget>[
                      emailInput(
                        context: context,
                        validator: (email) => EmailValidator.validate(email)
                            ? null
                            : "Invalid email address",
                        onSaved: (email) => _email = email,
                      ),
                      SizedBox(height: 12.0),
                      passwordInput(
                        context: context,
                        validator: (password) {
                          Pattern pattern =
                              r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(password))
                            return 'Invalid password';
                          else
                            return null;
                        },
                        onSaved: (password) => _password = password,
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                          }
                        },
                        child: Container(
                          height: 55.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              gradient: LinearGradient(
                                  colors: [kPrimaryColor, kSecondaryColor],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0.55, 1.0])),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey[300]),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 28.0,
                                width: 28.0,
                                color: Color(0xFF000090),
                                child: Center(
                                  child: Text(
                                    "f",
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Connect with Facebook",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000090),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "I'm new user,",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
