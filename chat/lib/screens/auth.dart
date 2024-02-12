import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
//onko kirjautuminen vai rekisteröinti
var _isLogin = true; //false == luodaan uusi tili

final _formKey = GlobalKey<FormState>();

var _enteredEmail = '';
var _enteredPassword = '';

void _submit(){
 final isValid = _formKey.currentState!.validate();
 if(isValid){
  _formKey.currentState!.save();


 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Enter your information'),
              Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: 
                        const InputDecoration(labelText: 'Email Address'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value){
                          if(value == null || value.trim().isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address!';
                          }
                          return null;
                        },
                        onSaved: (newValue){
                          _enteredEmail = newValue!;
                        },
                        ),
                        TextFormField(
                        decoration: 
                          const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value){
                          if(value == null || value.trim().length < 6) {
                            return 'Password must e at least 6 characters long!';
                          }
                          return null;                       
                        },
                        onSaved: (newValue){
                          _enteredPassword = newValue!;
                        },
                        ),
                        const SizedBox(height: 12,
                        ),
                        ElevatedButton(
                          onPressed: _submit, 
                          child: Text(_isLogin 
                          ? 'Login'
                          :'Signup',
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          }, 
                          child: Text(
                            _isLogin 
                            ?'Create an Account' 
                            : 'I already have an account'),
                          )
                        ],
                      ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}