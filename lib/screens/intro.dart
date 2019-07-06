import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _codeInput = '';

  final _textTheme = Typography.englishLike2018.copyWith(
    display1: Typography.englishLike2018.display1.copyWith(
      fontFamily: 'FuturaMedium',
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark, accentColor: Colors.lightGreen),
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Jak to działa?',
                  style: _textTheme.display1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    'Dodawaj swoje kupony i zbieraj żappsy. Gdy ktoś skorzysta z twojego kuponu, dostaniesz punkty, które możesz wymienić na nagrody.\n\nAby zacząć, wpisz swój kod kreskowy',
                    style: _textTheme.body2,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      _codeInput = newValue;
                    });
                  },
                  style: _textTheme.display1,
                  decoration: InputDecoration(border: UnderlineInputBorder()),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: BarCodeImage(
                          data: _codeInput,
                          codeType: BarCodeType.Code128,
                          lineWidth: 2.0,
                          barHeight: 60,
                          hasText: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Opacity(
                    opacity: 0.66,
                    child: Text(
                      'Swój kod znajdziesz w aplikacji żappka',
                      style: _textTheme.body2,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("DALEJ"),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                      onPressed: _codeInput.length < 12
                          // if less than 12 digits entered, disable the button
                          ? null
                          // else, return to previous screen with result
                          : () {
                              Navigator.pop(context, _codeInput);
                            },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
