import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: CupertinoThemeData(brightness: Brightness.light),
        home: TampilAlertDialog());
  }
}

class TampilAlertDialog extends StatefulWidget {
  TampilAlertDialog({Key? key}) : super(key: key);

  @override
  State<TampilAlertDialog> createState() => _TampilAlertDialogState();
}

class _TampilAlertDialogState extends State<TampilAlertDialog> {
  int pilihIndex = 0;

  DateTime pilihTanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Material & Cupertino"),
          backgroundColor: Colors.greenAccent
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hari, tanggal dan bulan : ${DateFormat.yMd().format(pilihTanggal)}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DatePickerDialog(
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1998),
                                lastDate: DateTime(2024));
                          });
                    },
                    child: Text(
                      "Material Button",
                      style: TextStyle(color: Colors.white60, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CupertinoButton(
                      color: Colors.blueAccent,
                      child: Text("Date Picker",
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 300,
                                color: Colors.white60,
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    backgroundColor: Colors.blueAccent,
                                    onDateTimeChanged: (tanggal) {
                                      print(tanggal);
                                      setState(() {
                                        pilihTanggal = tanggal;
                                      });
                                    }),
                              );
                            });
                      }),
                ],
              ),
            ],
          )),
    );
  }
}