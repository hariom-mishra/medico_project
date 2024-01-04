import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType type;
  final TextEditingController controller;
  int maxLines ;
  CustomTextField({
    Key? key,
    required this.hint,
    this.type = TextInputType.text,
    this.maxLines= 1,
    required this.controller,
  }) : super(key: key);

  bool _isObscure = true;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final returnVal;

    widget.type != TextInputType.visiblePassword
        ? returnVal = TextFormField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            keyboardType: widget.type,
            decoration: InputDecoration(
              hintText: widget.hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          )
        : returnVal = TextFormField(
            obscureText: widget._isObscure,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Password',
                suffixIcon: IconButton(
                    icon: Icon(
                        widget._isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget._isObscure = !widget._isObscure;
                      });
                    })),
              
          );
    return returnVal;
  }
}
