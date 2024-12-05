import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TField extends StatefulWidget {
  const TField({
    super.key,
    required this.controller,
    required this.hintText,
    this.number = false,
    this.length = 20,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool number;
  final int length;
  final void Function() onChanged;

  @override
  State<TField> createState() => _TFieldState();
}

class _TFieldState extends State<TField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.number ? TextInputType.number : null,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.length),
          if (widget.number) FilteringTextInputFormatter.digitsOnly,
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'w500',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 14,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color(0xff494949),
            fontSize: 18,
            fontFamily: 'w500',
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff4FB84F)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff4FB84F)),
          ),
        ),
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: (value) => widget.onChanged(),
      ),
    );
  }
}
