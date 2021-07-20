import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:phone/utilities/hex_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MaskedTextController _phoneNumberController = MaskedTextController(mask: "(000) 000-0000");

  void _clearTextField() {
    _phoneNumberController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: HexColor("4e4e4e")),
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                cursorColor: Colors.black,
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "(201) 555-0123",
                  helperText: "Enter your phone number",
                  suffixIcon: _phoneNumberController.text.length == 0
                      ? null
                      : IconButton(
                          onPressed: () => _clearTextField(),
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: HexColor("b5b5b5"),
                          ),
                        ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(14),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _phoneNumberController.text.length < 14
          ? CircleAvatar(
              radius: 28,
              backgroundColor: HexColor("eeeeee"),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                print('Done');
              },
              child: Icon(Icons.arrow_forward),
            ),
    );
  }
}
