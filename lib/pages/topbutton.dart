import 'package:flutter/material.dart';




class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.text,
    required this.isFavorite,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      OutlinedButton(
          style: TextButton.styleFrom(
            backgroundColor: isFavorite?Colors.yellow :Colors.white12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right: Radius.circular(20),)
            ),
          ),
          onPressed: onPressed,
          child: Text(text,style: TextStyle(color: Colors.black),));

  final String text;
  final bool isFavorite;
  final VoidCallback onPressed;

}

