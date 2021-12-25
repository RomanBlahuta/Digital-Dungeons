import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_bloc.dart';
import 'package:digitaldungeons/blocs/character/character-edit/character-edit_events.dart';
import '../utils/index.dart';

class DDInputText extends StatelessWidget {
  final String displayName;
  final String fieldName;
  final TextEditingController controller;

  const DDInputText({Key? key, required this.displayName, required this.controller, required this.fieldName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(displayName, style: DDTextTheme.Raleway18BlackBold, ),
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
          onChanged: (value) {
            context.read<DDCharacterEditBloc>().add(DDEditCharacterFieldEvent(value.toString().trim(), this.fieldName));
          },
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
