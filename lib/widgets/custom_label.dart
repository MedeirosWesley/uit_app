import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String label1;
  final String label2;
  final double? size;
  const CustomLabel(
      {super.key, this.size, required this.label1, required this.label2});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label1: ',
          style: TextStyle(
              fontSize: size ?? 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              decoration: TextDecoration.none),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          label2,
          style: TextStyle(
              fontSize: size ?? 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              decoration: TextDecoration.none),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
