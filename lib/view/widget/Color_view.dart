import 'package:flutter/material.dart';

class coloritem extends StatelessWidget {
  const coloritem({super.key, required this.select, required this.color});

  @override
  final bool select;
  final Color color;
  Widget build(BuildContext context) {
    return select
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class colorview extends StatefulWidget {
  const colorview({super.key});

  @override
  State<colorview> createState() => _colorviewState();
}

class _colorviewState extends State<colorview> {
  @override
  int Cindex = 0;
  List<Color> colors = const [
    Colors.yellow,
    Color.fromARGB(255, 167, 157, 75),
    Colors.grey,
    Color.fromARGB(255, 97, 135, 167),
    Color.fromARGB(255, 126, 54, 54),
    Color.fromARGB(255, 97, 148, 64)
  ];
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  Cindex = index;
                },
                child: coloritem(
                  color: colors[index],
                  select: Cindex == index,
                ),
              ),
            );
          }),
    );
  }
}
