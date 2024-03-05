import 'package:flutter/material.dart';

class icon extends StatelessWidget {
  const icon({super.key, required this.ico, this.onpressed});

  @override
  final void Function()? onpressed;
  final IconData ico;
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 68, 63, 63),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: IconButton(
          onPressed: onpressed,
          icon: Icon(
            ico,
            size: 26,
          ),
        ),
      ),
    );
  }
}
