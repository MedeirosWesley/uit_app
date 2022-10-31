// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_uit/consts.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String label;
  final void Function()? onTap;

  const HomeMenu({
    Key? key,
    required this.icon,
    required this.title,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(2, 2))
            ]),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: defaultTextTitleStyle,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Expanded(
                  child: Text(
                    label,
                    style: defaultTextlabelStyle,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            )),
            Icon(
              icon,
              color: Colors.teal.shade300,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
