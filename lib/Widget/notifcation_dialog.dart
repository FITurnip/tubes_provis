import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class NotifcationDialog extends StatelessWidget {
  Widget content;
  
  NotifcationDialog(this.content);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 52,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: basicYellow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: double.infinity,
              child: content
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: basicYellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            )
          ),
        ],
        ),
    );
  }
}
