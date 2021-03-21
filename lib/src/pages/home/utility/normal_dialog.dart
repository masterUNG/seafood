import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String massage) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(massage),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlineButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        )
      ],
    ),
  );
}
