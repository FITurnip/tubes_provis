import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tubes/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          width: 60,
          image: Svg('assets/img/app_logo.svg'),
        ),
        Text(
          my_app_name,
          style: TextStyle(color: basicYellow, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: basicYellow,
            ))
      ],
    );
  }
}
