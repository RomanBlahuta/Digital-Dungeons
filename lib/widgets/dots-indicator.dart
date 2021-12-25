import 'package:flutter/material.dart';

import '../utils/index.dart';

class DDDotsIndicator extends StatelessWidget {
  final len;
  final indicate;

  const DDDotsIndicator({Key? key, required this.len, required this.indicate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < len; i++)
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(
                  width: 10,
                  height: 10,
                  decoration: (i == indicate)
                      ?
                  BoxDecoration(
                    color: DDTheme.primaryColor,
                    shape: BoxShape.circle,
                  )
                      :
                  BoxDecoration(
                    // color: DDTheme.primaryColor,
                    border: Border.all(color: DDTheme.primaryColor, width: 2),
                    shape: BoxShape.circle,
                  )
              ),
            )
        ]
    );
  }
}