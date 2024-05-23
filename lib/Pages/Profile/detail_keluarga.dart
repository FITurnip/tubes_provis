import 'package:flutter/material.dart';
import 'package:tubes/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailKeluarga(),
    );
  }
}

class DetailKeluarga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Keluarga Terdaftar",
            style: getDefaultTextStyle(font_size: 18.0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: normalWhite, // White background for the container
              border: Border.all(color: defBlue, width: 2),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset:
                      Offset(0, 3), // Offset for shadow outside the container
                ),
              ],
            ),
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(
                            0, 3), // Offset for shadow outside the circle
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with actual image URL
                  ),
                ),
                SizedBox(height: 16),
                Text('Alfen Fajri Nurulhaq',
                    textAlign: TextAlign.start,
                    style: getDefaultTextStyle(
                        font_size: 18, font_weight: FontWeight.w600)),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Text(
                  '327891819819819818',
                  style: getDefaultTextStyle(
                      font_size: 16, font_weight: FontWeight.w500),
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Text(
                  'Laki - laki',
                  style: getDefaultTextStyle(
                      font_size: 16, font_weight: FontWeight.w500),
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bandung, ',
                      style: getDefaultTextStyle(
                          font_size: 16, font_weight: FontWeight.w500),
                    ),
                    Text(
                      '13 Februari 2004',
                      style: getDefaultTextStyle(
                          font_size: 16, font_weight: FontWeight.w500),
                    ),
                  ],
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
                Text(
                  '081214638193',
                  style: getDefaultTextStyle(
                      font_size: 16, font_weight: FontWeight.w500),
                ),
                Divider(
                  color: blackColor,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
