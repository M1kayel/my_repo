import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: IconButton(
              onPressed: null,
              icon: Image.asset('images/facebook.png', width: 20, height: 30),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: IconButton(
              onPressed: null,
              icon: Image.asset('images/twitter.png', width: 20, height: 30),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: IconButton(
              onPressed: null,
              icon: Image.asset('images/linkedin.png', width: 20, height: 30),
            ),
          ),
        ],
      ),
    );
  }
}
