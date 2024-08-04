import 'package:flutter/widgets.dart';

class UserCountWidget extends StatelessWidget {
  const UserCountWidget(
      {super.key, required this.integer, required this.string});
  final int integer;
  final String string;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(integer.toString()),
        Text(string),
      ]),
    );
  }
}