import 'package:flutter/material.dart';

class ShowDialogPopUp extends StatelessWidget {
  const ShowDialogPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 8,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This is a dialog'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK")),
              ],
            )));
  }
}