import 'dart:ui';

import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: Colors.amberAccent,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.5),
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            width: 150,
            height: 180,
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(12.0)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Total Per Person",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount",
                        icon: Icon(Icons.attach_money)),
                    onChanged: (String Value) {
                      try {
                        _billAmount = double.parse(Value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () => {
                              // if (_personCounter > 1) {_personCounter--} else {}
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {}
                              })
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.lightBlueAccent),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.lightBlueAccent),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // Tip
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tip",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        )
                      ]),
                  // Slider
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercentage% ",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.lightBlueAccent,
                          inactiveColor: Colors.grey,
                          // divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ))
        ],
      ),
    ));
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.",
    "Keep love in your heart. A life without it is like a sunless garden when the flowers are dead.",
    "It is during our darkest moments that we must focus to see the light.",
    "Try to be a rainbow in someone's cloud.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text(quotes[_index % quotes.length]))),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: FlatButton.icon(
              onPressed: _showQuotes,
              color: Colors.amberAccent,
              icon: Icon(Icons.wb_cloudy),
              label: Text(
                "Quotes",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Spacer()
        ],
      )),
    );
  }

  void _showQuotes() {
    setState(() {
      _index += 1;
    });
  }
}

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("email Tapped")),
          IconButton(
              icon: Icon(Icons.paid), onPressed: () => debugPrint("paid")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.phone_android),
        onPressed: () => debugPrint("Forward"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "FRW"),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo_sharp),
          label: "BRW",
        )
      ]),
      backgroundColor: Color.fromARGB(159, 64, 255, 169),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton()
              // InkWell(
              //   child: Text(
              //     "Tap me",
              //     style: TextStyle(fontSize: 25),
              //   ),
              //   onTap: () => debugPrint("Tapped...."),
              // )
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            "Bye!",
            textDirection: TextDirection.ltr,
          ),
          backgroundColor: Colors.amberAccent,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Click Me",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     "Hello There!",
    //     textDirection: TextDirection.ltr,
    //   ),
    // );

    return Material(
      color: Colors.blueGrey,
      child: Text(
        "Hello There!",
        textDirection: TextDirection.ltr,
      ),
    );

    return Material(
      color: Colors.orange,
      child: Center(
          child: Text(
        "Hello There!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
      )),
    );
  }
}
