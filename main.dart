import 'dart:ui';

import 'package:flutter/material.dart';

class Data {
  String kode = "";
  String nama = "";
  String vol = "";
  String turnOver = "";
  String harga = "";
  String naikTurun = "";
  String pctNaikTurun = "";

  Data(this.kode, this.nama, this.vol, this.turnOver, this.harga,
      this.naikTurun, this.pctNaikTurun);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String? dropdown1;
  String? dropdown2;
  final List<String> vDropdown1 = [
    'Active Turn Over',
    'Active Volume',
  ];
  final List<String> vDropdown2 = [
    '1D',
    '1W',
  ];

  get child => null;

  List<Data> datalist = [
    Data(
      "BBRI",
      "Bank Rakyat Indonesia",
      "125M",
      "605B",
      "4820",
      "+80",
      "+2.00%",
    ),
    Data(
      "TLKM",
      "Telkom Indonesia",
      "77M",
      "310B",
      "4810",
      "+100",
      "+5.00%",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdown1,
                    onChanged: (value) {
                      setState(() {
                        dropdown1 = value;
                      });
                    },
                    items: vDropdown1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdown2,
                    onChanged: (value) {
                      setState(() {
                        dropdown2 = value;
                      });
                    },
                    items: vDropdown2.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: datalist.map((entry) {
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                              title: Text(entry.kode),
                              subtitle: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text("Volume"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text("Turn Over"),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: ListTile(
                              title: Text(entry.nama),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(entry.vol),
                                  Text(entry.turnOver),
                                ],
                              )),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(entry.harga),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Column(children: [
                              Text(entry.naikTurun),
                              Text(entry.pctNaikTurun),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  container({required ListView child}) {}
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 11'),
            content: const Text(
                'Khana Yusdiana (khanayusdiana@upi.edu) ; Farhan (farhanmuzhaffar@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
