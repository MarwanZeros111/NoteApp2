import 'package:flutter/material.dart';
import 'package:my_note_app/view/widget/custom_icon.dart';

class customAppBar extends StatelessWidget {
  const customAppBar(
      {required this.text, super.key, required this.ico, this.onpressed});

  @override
  final void Function()? onpressed;
  final String text;
  final IconData ico;
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 30),
        ),
        Spacer(),
        icon(
          onpressed: onpressed,
          ico: ico,
        )
      ],
    );
  }
}
