import 'package:flutter/material.dart';
import 'package:instagram/widgets/constant_gaps.dart';


class DropDownMenuWidget extends StatelessWidget {
  const DropDownMenuWidget(
      {super.key,
      required this.myicon,
      required this.text,
      required this.onPressed});
  final IconData myicon;
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: Gaps.large,
        ),
        Icon(myicon),
        TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}