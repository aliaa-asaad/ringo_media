import 'package:flutter/material.dart';
import 'package:ringo_media/core/components/custom_button.dart';
import 'package:ringo_media/core/components/custom_form_field.dart';
import 'package:ringo_media/core/routing/navigator.dart';
import 'package:ringo_media/core/routing/routes.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/core/validations/validators.dart';
import 'package:ringo_media/features/login/presentation/view/widgets/social_media_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validations {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: /* LoginCubit. */ formKey,
          onChanged: () {
            if (formKey.currentState != null &&
                formKey.currentState!.validate()) {
              setState(() {
                isFormValid = true;
              });
            } else {
              setState(() {
                isFormValid = false;
              });
            }
          },
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
                    onPressed: isFormValid
                        ? () {
                            if ( formKey.currentState!
                                .validate()) {
                              AppRoutes.pushNamedNavigator(
                                  routeName: Routes.navBar,
                                  replacementAll: true);
                            }
                          }
                        : null,
                    text: 'Login',
                    /* background: formKey.currentState!.validate()
                        ? CutsomColors.neutralColor900
                        : CutsomColors.neutralColor300, */
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
