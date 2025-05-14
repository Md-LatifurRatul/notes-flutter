import 'package:flutter/material.dart';

class AuthBottomSection extends StatelessWidget {
  const AuthBottomSection({
    super.key,
    required this.labelText,
    required this.authText,
    this.onPressed,
  });
  final String labelText;
  final String authText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelText),
        TextButton(onPressed: onPressed, child: Text(authText)),
      ],
    );
  }
}
