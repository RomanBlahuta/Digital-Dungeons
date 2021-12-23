import 'package:flutter/material.dart';
import '../utils/index.dart';

class DDInfoSection {
  static Widget parameter(String title, List<String> terms, List<String> values) {
    return DDParameterInfoSection(title: title, terms: terms, values: values);
  }

  static Widget main(List<String> terms, List<String> values) {
    return DDMainInfoSection(terms: terms, values: values);
  }

  static Widget text(String title, List<String> terms, List<String> values) {
    return DDTextInfoSection(title: title, terms: terms, values: values);
  }
}

class DDMainInfoSection extends StatelessWidget {
  final List<String> terms;
  final List<String> values;

  const DDMainInfoSection({ Key? key, required this.terms, required this.values }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final term in terms) Padding(
              padding: EdgeInsets.only(bottom: 16), 
              child: Text(
                term, 
                textAlign: TextAlign.start, 
                style: DDTextTheme.Raleway20PrimaryBold,
              ),
            ),
          ],
        ),

        SizedBox(width: 42,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final value in values) Padding(
              padding: EdgeInsets.only(bottom: 16), 
              child: Text(
                value, 
                textAlign: TextAlign.start, 
                style: DDTextTheme.Raleway20WhiteRegular,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DDParameterInfoSection extends StatelessWidget {
  final String title;
  final List<String> terms;
  final List<String> values;

  const DDParameterInfoSection({ Key? key, required this.title, required this.terms, required this.values }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: DDTextTheme.Raleway24AccentBold,
            ),
            SizedBox(
              width: 11,
            ),
            Expanded(
              child: Divider(
                thickness: 2,
                color: DDTheme.primaryColor,
              ),
            )
          ],
        ),

        SizedBox(
          height: 16,
        ),

        Row(
          children: [
            SizedBox(width: 24,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final term in terms) Padding(
                  padding: EdgeInsets.only(bottom: 16), 
                  child: Text(
                    term, 
                    textAlign: TextAlign.start, 
                    style: DDTextTheme.Raleway18BlackBold,
                  ),
                ),
              ],
            ),

            SizedBox(width: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final value in values) Padding(
                  padding: EdgeInsets.only(bottom: 16), 
                  child: Text(
                    value, 
                    textAlign: TextAlign.start, 
                    style: DDTextTheme.Raleway18BlackRegular,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class DDTextInfoSection extends StatelessWidget {
  final String title;
  final List<String> terms;
  final List<String> values;

  const DDTextInfoSection({ Key? key, required this.title, required this.terms, required this.values }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: DDTextTheme.Raleway24AccentBold,
            ),
            SizedBox(
              width: 11,
            ),
            Expanded(
              child: Divider(
                thickness: 2,
                color: DDTheme.primaryColor,
              ),
            )
          ],
        ),

        SizedBox(
          height: 16,
        ),
        
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (var i = 0; i < terms.length; i++) Padding(
                padding: EdgeInsets.only(bottom: 16, left: 24, right: 24), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      terms[i], 
                      textAlign: TextAlign.start, 
                      style: DDTextTheme.Raleway18BlackBold,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      values[i], 
                      textAlign: TextAlign.start, 
                      style: DDTextTheme.Raleway18BlackRegular,
                    ),
                  ],
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}