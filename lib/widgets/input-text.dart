import 'package:flutter/material.dart';

import '../utils/index.dart';

class DDInputText extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;

  const DDInputText({Key? key, required this.fieldName, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(fieldName, style: DDTextTheme.Raleway18BlackBold, ),
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Field couldn't be empty!";
            }
          },
          maxLines: null,
          minLines: 1,
          // textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          style: DDTextTheme.Raleway20BlackRegular,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: DDTheme.darkColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: DDTheme.darkColor, width: 2.0),
            ),
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
