import 'package:flutter/material.dart';
import 'package:my_note_app/view/widget/custom_appbar.dart';
import 'package:my_note_app/view/widget/custom_view_item.dart';

class noteViewBody extends StatefulWidget {
  const noteViewBody({super.key});

  @override
  State<noteViewBody> createState() => _noteViewBodyState();
}

class _noteViewBodyState extends State<noteViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          customAppBar(
            text: 'Note',
            ico: Icons.search,
          ),
          Expanded(child: notesitem())
        ],
      ),
    );
  }
}
