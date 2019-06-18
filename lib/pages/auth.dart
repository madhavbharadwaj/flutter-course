import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;
  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEMailTextField() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "E-Mail", filled: true, fillColor: Colors.white),
        onChanged: (String value) {
          setState(() {
            _emailValue = value;
          });
        });
  }

  Widget _buildPasswordTextField() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Password", filled: true, fillColor: Colors.white),
        onChanged: (String value) {
          setState(() {
            _passwordValue = value;
          });
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text("Accept Terms"),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildEMailTextField(),
                    _buildPasswordTextField(),
                    SizedBox(height: 10.0),
                    _buildAcceptSwitch(),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text("LOGIN"),
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ),
            )));
  }
}
