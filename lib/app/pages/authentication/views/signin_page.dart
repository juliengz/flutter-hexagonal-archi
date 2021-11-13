import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/pages/authentication/controllers/signin_controller.dart';
import 'package:flutter_api_test/app/utils/sizing.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SigninPage extends GetView<SigninController> {
  final _formKey = GlobalKey<FormBuilderState>();

  SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(spacingFactor(5)),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.supervised_user_circle,
                  size: 100.0,
                  color: Colors.pink,
                ),
                SizedBox(height: spacingFactor(4)),
                FormBuilderTextField(
                  name: 'login',
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'login',
                  ),
                ),
                SizedBox(height: spacingFactor(2)),
                FormBuilderTextField(
                  name: 'password',
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'password',
                  ),
                ),
                SizedBox(height: spacingFactor(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Create your account'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  minWidth: double.infinity,
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.signin(_formKey);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
