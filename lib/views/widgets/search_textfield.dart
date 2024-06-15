import 'package:flutter/material.dart';

import '../../theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obsecure;
  final Icon icon;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText = "Search",
    this.obsecure = false,
    this.icon = const Icon(
      Icons.search,
      color: Color(0xff7F7F7F),
    ),
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obsecure;
  }

  @override
  void dispose() {
    widget.controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: TextField(
          obscureText: _obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: widget.hintText,
            hintStyle: regulerText.copyWith(
              color: cGrey,
            ),
            prefixIcon: widget.icon,
            suffixIcon: widget.obsecure
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ));
  }
}
