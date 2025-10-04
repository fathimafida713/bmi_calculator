import 'package:flutter/material.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  TextEditingController heightcontroller=TextEditingController();
  TextEditingController weightcontroller=TextEditingController();
  String Result="";
  void Calculate(){
    double height=double.parse(heightcontroller.text)/100;
    double weight=double.parse(weightcontroller.text);
    double BMI=weight/(height*height);
if(BMI<=18.5){
    setState(() {
      Result="your BMI is ${BMI.toStringAsFixed(2)} underweight";
    });
  }
  else if(BMI>=18.5&&BMI<=24.5){
    setState(() {
      Result="your BMI is ${BMI.toStringAsFixed(2)} normal";
    });
  }
  else if(BMI>=29.9)
  { 
    setState(() {
      Result="your BMI is ${BMI.toStringAsFixed(2)}  overweight";
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 44, 80, 170),
              const Color.fromARGB(255, 15, 1, 70),
              const Color.fromARGB(255, 4, 0, 5),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "BMI CALCULATOR",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 300,
                width: 260,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        TextField(controller: heightcontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            prefixIcon: Icon(Icons.height, color: Colors.black),
                            labelText: "Height (cm)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(controller: weightcontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.monitor_weight_rounded,
                              color: Colors.black,
                            ),
                            labelText: "weight (kg)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(onTap: () {
                          Calculate();
                        },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 44, 80, 170),
                                  const Color.fromARGB(255, 15, 1, 70),
                                  const Color.fromARGB(255, 4, 0, 5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Calculate",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),SizedBox(height: 20,),

                        Text("$Result",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
