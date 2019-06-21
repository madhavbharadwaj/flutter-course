import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';
class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false,
  };

  // String _emailValue;
  // String _passwordValue;

  //bool _acceptTerms = false;
  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEMailTextField() {
    return TextFormField(
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Please enter a valid email';
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "E-Mail", filled: true, fillColor: Colors.white),
        onSaved: (String value) {
          _formData['email'] = value;
        });
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
        validator: (String value) {
          if (value.isEmpty || value.length < 8) {
            return 'Password is required and should be 8+ characters';
          }
        },
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Password", filled: true, fillColor: Colors.white),
        onSaved: (String value) {
          _formData['password'] = value;
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text("Accept Terms"),
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
    );
  }

  void _submitForm(Function login) {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    //print(_formData);
  login(_formData['email'],_formData['password']);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
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
              child: Container(
                width: targetWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildEMailTextField(),
                      SizedBox(height: 10.0),
                      _buildPasswordTextField(),
                      SizedBox(height: 10.0),
                      _buildAcceptSwitch(),
                      SizedBox(height: 10.0),
                      ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model) {
                          return  RaisedButton(
                        textColor: Colors.white,
                        child: Text("LOGIN"),
                        onPressed: () => _submitForm(model.login),
                      );
                      },) 
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
