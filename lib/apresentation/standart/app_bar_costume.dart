import 'package:flutter/material.dart';

class AppBarCostume extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  AppBarCostume({
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    final double icon = MediaQuery.of(context).size.height * 0.035;

    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: icon,
                ),
                onPressed: () {},
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: icon,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
        ),
        IconButton(
          icon: const Icon(Icons.account_circle_sharp),
          iconSize: MediaQuery.of(context).size.height * 0.05,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
