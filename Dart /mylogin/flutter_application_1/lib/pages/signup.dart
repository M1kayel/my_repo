import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/preferences_service.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/textform.dart';

class SignUp extends StatefulWidget {
  const SignUp(this.preferenceService, {super.key});

  final PreferenceService preferenceService;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(82, 84, 100, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(top: 60),
              icon: SizedBox(
                width: 100,
                height: 145,
                child: Image.asset('images/image_2.png'),
              ),
            ),
            Form(
              key: _globalKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  TextFormWidget(
                    controller: _usernameController,
                    hintText: 'Enter username',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormWidget(
                    controller: _phoneNumberController,
                    hintText: 'Enter phone number',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormWidget(
                    controller: _emailController,
                    hintText: 'Enter email',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormWidget(
                    controller: _passwordController,
                    hintText: 'Enter password',
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormWidget(
                    hintText: 'Confirm password',
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    _globalKey,
                    onTap: () {
                      _signUp();
                    },
                    'Sign up',
                    315,
                    60,
                    const Color.fromRGBO(32, 195, 175, 1),
                    const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  const SizedBox(height: 20),
                  const Text('or',
                      style: TextStyle(
                          color: Color.fromRGBO(131, 131, 145, 1),
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 177, 157, 1),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/sign-in');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All fields are required')));
      return;
    }

    try {
      await widget.preferenceService.setUsername(_usernameController.text);
      await widget.preferenceService.setPassword(_passwordController.text);
      await widget.preferenceService
          .setPhoneNumber(_phoneNumberController.text);
      await widget.preferenceService.setEmail(_emailController.text);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/profile');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
