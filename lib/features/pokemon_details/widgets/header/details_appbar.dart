import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsAppbar extends StatelessWidget {
  final Color iconsColor;
  const DetailsAppbar({super.key, required this.iconsColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.chevron_back, color: iconsColor),
            onPressed: () => Navigator.pop(context),
          ),
          // IconButton(
          //   icon: Icon(Icons.favorite_border, color: iconsColor),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
