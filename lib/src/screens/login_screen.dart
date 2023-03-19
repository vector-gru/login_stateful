import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  String? email = '';
  String? password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            submitButton(),

          ],
        )
      ),
    );
  } 

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration (
         labelText: 'Email Address',
         hintText: 'example@email.com'
      ), 
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },    
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );

  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: (){
        if (formKey.currentState?.validate() ?? false) {
          formKey.currentState?.save();
          print('Time to post $email and $password to my API');
        }
      }, 
      child: const Text ('Submit')
      );
  }
} 