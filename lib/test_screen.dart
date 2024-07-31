import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ringo_media/core/components/custom_button.dart';
import 'package:ringo_media/core/components/custom_form_field.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/core/validations/validators.dart';
import 'package:ringo_media/features/login/presentation/view/widgets/social_media_buttons.dart';




// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> with Validations {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: /* LoginCubit. */_formKey,
          autovalidateMode: AutovalidateMode.always,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyleHelper.bold24,
                  ),
                  Text(
                    'Sign in to your account',
                    style: TextStyleHelper.medium14,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Username / Email',
                    style: TextStyleHelper.semiBold14,
                  ),
                  CustomFormField(
                    hintText: 'Enter your username or email',
                    keyboardType: TextInputType.text,
                    controller: emailController,
                    validator: isValidContent,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Password',
                    style: TextStyleHelper.semiBold14,
                  ),
                  CustomFormField(
                    hintText: 'Enter your username or email',
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    isAuth: true,
                    isPassword: true,
                    validator: isValidPassword,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyleHelper.semiBold14,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    onPressed: () {
                        if (/* LoginCubit. */_formKey.currentState!.validate()) {
                        log('Validated');
                      } 
                    },
                    text: 'Login',
                     background: /* LoginCubit. */_formKey.currentState!.validate()
                        ? CutsomColors.neutralColor900
                        : CutsomColors.neutralColor300, 
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                      child: Text(
                    'Or login with account',
                    style: TextStyleHelper.semiBold12,
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  const SocialMediaButtons(),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyleHelper.medium14,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register here',
                          style: TextStyleHelper.bold14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
);
  }
}