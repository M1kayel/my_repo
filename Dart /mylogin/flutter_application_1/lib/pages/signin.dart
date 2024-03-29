import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_1/db/preferences_service.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/container.dart';
import 'package:flutter_application_1/widgets/textform.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn(this.preferenceService, {super.key});

  final PreferenceService preferenceService;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
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
              onPressed: null,
              padding: const EdgeInsets.only(top: 60),
              icon: SizedBox(
                width: 100,
                height: 145,
                child: Image.asset('images/image_1.png'),
              ),
            ),
            Form(
              key: _globalKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  TextFormWidget(
                    controller: _usernameController,
                    hintText: 'Username',
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
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    _globalKey,
                    'Login',
                    onTap: _signIn,
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
                  const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                            size: 50,),//),
                  const SizedBox(width: 50,),
                  Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                        size: 50,),
                  const SizedBox(width: 50,),
                  Icon( 
                        FontAwesomeIcons.linkedin,
                        color:Colors.blue,
                        size:50,),
                ],),
                
                 // const ContainerWidget(),
                 const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 177, 157, 1),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/sign-up');
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

  void _signIn() {
    final String? username = widget.preferenceService.getUsername();
    final String? password = widget.preferenceService.getPassword();

    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username or password cannot be empty')));
      return;
    }

    if (username == _usernameController.text &&
        password == _passwordController.text) {
      Navigator.of(context).pushNamed('/profile');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
  }
}
