import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  double BMI = 0;
  String cond = " ";
  String finalresult = "";

  CalcBMI() {
    setState(() {
      double height = double.parse(_height.text);
      double weight = double.parse(_weight.text);
      if (_age.text.isEmpty)
        BMI = 0;
      else
        BMI = weight / (height * height);

      if (BMI == 0) {
        cond = "Error";
      } else if (double.parse(BMI.toStringAsFixed(2)) <= 15) {
        cond = "Very severely underweight ";
      } else if (BMI > 15 && BMI < 16) {
        cond = "Severely underweight";
      } else if (BMI >= 16 && BMI < 18.5) {
        cond = " Underweight ";
      } else if (BMI >= 18.5 && BMI < 25) {
        cond = " Normal (healthy weight)";
      } else if (BMI >= 25 && BMI < 30) {
        cond = " Overweight";
      } else if (BMI >= 30 && BMI < 35) {
        cond = " Moderately obese";
      } else if (BMI >= 35 && BMI < 40) {
        cond = "Severely obese";
      } else if (BMI > 40) {
        cond = " Very severely obese";
      } else {
        cond = "_";
      }
      finalresult = " Your BMI: ${BMI.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(""),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'images/bmilogo.png',
                scale: 1.5,
              ),
              Container(
                margin: EdgeInsets.all(6),
                color: Colors.blueGrey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "AGE", icon: Icon(Icons.person)),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "HEIGHT IN m",
                          icon: Icon(Icons.insert_chart)),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    TextField(
                      onSubmitted: (val) {
                        if (val.isNotEmpty) {
                          _height.text = val;
                        } else {
                          _height.text = null;
                        }
                      },
                      controller: _weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "WEIGHT IN kg",
                          icon: Icon(Icons.line_weight)),
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 50,
                        color: Colors.pinkAccent,
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      onTap: CalcBMI,
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BMI == 0
                      ? Text(" ")
                      : Text(
                          "$finalresult",
                          style: TextStyle(color: Colors.blue, fontSize: 30),
                        ),
                ),
              ),
              Padding(padding: EdgeInsets.all(2.0)),
              Center(
                child: BMI == 0
                    ? Text(" ")
                    : Text(
                        "$cond",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                      ),
              )
            ],
          ),
        )
      ],
    );
  }
}
