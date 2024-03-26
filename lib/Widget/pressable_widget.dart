import 'package:flutter/widgets.dart';

class PressableWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const PressableWidget({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
      ),
    );
  }
}