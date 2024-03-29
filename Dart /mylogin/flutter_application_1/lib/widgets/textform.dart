import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({
    super.key,
    this.validator,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.controller,
    this.initialValue,
  });

  final String? Function(String?)? validator;
  final String? hintText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: widget.validator,
      style: const TextStyle(fontSize: 16),
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color.fromRGBO(247, 247, 247, 1),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
