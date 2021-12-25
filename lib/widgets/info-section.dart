import 'package:flutter/material.dart';
import '../utils/index.dart';

class DDInfoSection {
  static Widget parameter(String title, List<String> terms, List<String> values) {
    return DDParameterInfoSection(title: title, terms: terms, values: values);
  }

  static Widget main(List<String> terms, List<String> values) {
    return DDMainInfoSection(terms: terms, values: values);
  }

  static Widget text(String title, List<String> terms, List<List<String>> values) {
    return DDTextInfoSection(title: title, terms: terms, values: values);
  }

  static Widget description(List<String> terms, List<String> values) {
    return DDDescriptionSection(terms: terms, values: values);
  }

  static Widget row_parameters(List<String> terms, List<String> values) {
    return DDRowParametersSection(terms: terms, values: values);
  }

  static Widget column_parameters(String title, List<String> terms, List<List<String>> values) {
    return DDColumnsInfoSection(title: title, terms: terms, values: values);
  }

  static Widget skills(String title, Map<String, List<List<dynamic>>> values) {
    return DDSkillsInfoSection(title: title, values: values);
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

            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Column(
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
              )
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
  final List<List<String>> values;

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
                    for (var j = 0; j < values[i].length; j++) Text(
                      values[i][j], 
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

class DDDescriptionSection extends StatelessWidget {
  final List<String> terms;
  final List<String> values;

  const DDDescriptionSection({ Key? key, required this.terms, required this.values }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
                        style: DDTextTheme.Raleway20AccentBold,
                      ),
                      SizedBox(
                        height: 11,
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

class DDRowParametersSection extends StatelessWidget {
  final List<String> terms;
  final List<String> values;

  const DDRowParametersSection({ Key? key, required this.terms, required this.values }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        for (var i = 0; i < terms.length; i++) Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  child: Text(
                    terms[i],
                    textAlign: TextAlign.start,
                    style: DDTextTheme.Raleway20AccentBold,
                  ),
                ),
              ),
              SizedBox(width: 2,),
              Expanded(
                  child: Container(
                    child: Text(
                      values[i],
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: DDTextTheme.Raleway20BlackRegular,
                    ),
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}

class DDColumnsInfoSection extends StatelessWidget {
  final String title;
  final List<String> terms;
  final List<List<String>> values;

  const DDColumnsInfoSection({ Key? key, required this.title, required this.terms, required this.values }) : super(key: key);

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
          padding: EdgeInsets.only(left: 24),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    for (var i = 0; i < terms.length; i++) Expanded(
                      child: Text(terms[i], style: DDTextTheme.Raleway18BlackBold),
                    ),
                  ],
                ),
              ),

              for (var i = 0; i < terms.length; i++) Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    for (var j = 0; j < values.length; j++) Expanded(
                      child: Text(values[j][i], style: DDTextTheme.Raleway18BlackRegular),
                    ),
                  ],
                )
              ),
            ],
          )
        )
      ],
    );
  }
}

class DDSkillsInfoSection extends StatelessWidget {
  final String title;
  final Map<String, List<List<dynamic>>> values;

  const DDSkillsInfoSection({ Key? key, required this.title, required this.values }) : super(key: key);

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
          padding: EdgeInsets.only(left: 24),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < values.length; i++) Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(values.keys.toList()[i], style: DDTextTheme.Raleway18BlackBold),
                  SizedBox(height: 24,),
                  for (var j = 0; j < values[values.keys.toList()[i]]!.length; j++) Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 48),
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                              color: values[values.keys.toList()[i]]![j][0] ? Colors.black : Colors.transparent
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            values[values.keys.toList()[i]]![j][1], 
                            style: DDTextTheme.Raleway18BlackRegular,
                          )
                        ),
                        
                        Expanded(
                          flex: 3, 
                          child: Text(
                            values[values.keys.toList()[i]]![j][2], 
                            style: DDTextTheme.Raleway18BlackRegular,
                          )
                        ),
                      ],
                    )
                  ),

                  SizedBox(height: 24,)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}