import 'package:flutter/material.dart';

class CircledIcon extends StatelessWidget {
  final IconData iconData;
  final Color? containerColor;
  const CircledIcon({
    Key? key,
    this.iconData = Icons.favorite,
    this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      width: 33,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor ?? Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, size: 20),
    );
  }
}
