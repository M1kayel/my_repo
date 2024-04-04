import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/preferences_service.dart';
import 'package:flutter_application_1/widgets/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    this.preferenceService,
  });

  final PreferenceService? preferenceService;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String? username;
  String? phoneNumber;
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    username = widget.preferenceService?.getUsername();
    email = widget.preferenceService?.getEmail();
    password = widget.preferenceService?.getPassword();
    phoneNumber = widget.preferenceService?.getPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 104),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 57,
                    backgroundImage: AssetImage('images/manimage.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$username',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New York ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(131, 131, 145, 1),
                        ),
                      ),
                      Container(
                        width: 5.36,
                        height: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        ' ID: 112061',
                        style: TextStyle(
                          color: Color.fromRGBO(131, 131, 145, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _editPage,
                    child: const Text('Edit',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 177, 157, 1),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(255, 177, 157, 1),
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        _globalKey,
                        'About me',
                        150,
                        60,
                        const Color.fromRGBO(246, 242, 242, 1),
                        const Color.fromRGBO(82, 84, 100, 1),
                      ),
                      ButtonWidget(
                        _globalKey,
                        onTap: () => {Navigator.pushNamed(context, '/sign-in')},
                        'Log Out',
                        150,
                        60,
                        const Color.fromRGBO(32, 195, 175, 1),
                        const Color.fromRGBO(255, 255, 255, 1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromRGBO(82, 84, 100, 1),
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 27),
                      width: 315,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(226, 226, 224, 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: Image.asset('images/call.png'),
                          ),
                          const SizedBox(width: 25),
                          Container(
                            width: 1,
                            height: 42,
                            color: const Color.fromRGBO(236, 236, 235, 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 27, top: 20),
                            child: Column(
                              children: [
                                const Text(
                                  'Phone number',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  '$phoneNumber',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 56),
                    Container(
                      padding: const EdgeInsets.only(left: 27),
                      width: 315,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(226, 226, 224, 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: Image.asset('images/message.png'),
                          ),
                          const SizedBox(width: 25),
                          Container(
                            width: 1,
                            height: 42,
                            color: const Color.fromRGBO(236, 236, 235, 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 27, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  email ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 56),
                    Container(
                      padding: const EdgeInsets.only(left: 27),
                      width: 315,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(226, 226, 224, 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: Image.asset('images/circle.png'),
                          ),
                          const SizedBox(width: 25),
                          Container(
                            width: 1,
                            height: 42,
                            color: const Color.fromRGBO(236, 236, 235, 1),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 27, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Completed projects',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  '248',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
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
            ),
          ),
        ],
      ),
    );
  }

  void _editPage() {
    Navigator.of(context).pushNamed('/edit-page');
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => EditPage(
    //       username: widget.username,
    //       phoneNumber: widget.phoneNumber,
    //       email: widget.email,
    //       password: widget.password,
    //     ),
    //   ),
    // );
  }
}
