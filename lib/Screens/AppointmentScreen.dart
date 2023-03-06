import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  static String image = "";
  // AppointmentScreen(this.image);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  int c1 = 0;
  int c2 = 0;
  int c3 = 0;
  int c4 = 0;
  int c5 = 0;
  int c6 = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 3, 4),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 18, 241),
        title: Text('Appointment'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  // backgroundColor: Color.fromARGB(255, 22, 18, 241),
                  backgroundColor: Colors.black,
                  maxRadius: 100,
                  backgroundImage: AssetImage("assets/images/d2.png"),
                  // child: Image.asset("assets/images/archit.jpeg"),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Text(
                  "Choose a Date ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text("${selectedDate.toLocal()}".split(' ')[0]),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: const Text('Select date'),
                      style: ButtonStyle(
                        // shape: MaterialStateProperty.all(OutlinedBorder(side: BorderSide.merge(a, b))),
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 22, 18, 241),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                child: SingleChildScrollView(
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: [
                      InkWell(
                        onTap: (() {
                          setState(() {
                            c1 = 1;
                            c2 = 0;
                            c3 = 0;
                            c4 = 0;
                            c5 = 0;
                            c6 = 0;
                          });
                        }),
                        child: Card(
                          color: (c1 == 1)
                              ? Color.fromARGB(255, 22, 18, 241)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 30,
                            child: Text(
                              '9:00 AM',
                              style: TextStyle(
                                color: (c1==1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            c1 = 0;
                            c2 = 1;
                            c3 = 0;
                            c4 = 0;
                            c5 = 0;
                            c6 = 0;
                          });
                        }),
                        child: Card(
                          color: (c2 == 1)
                              ? Color.fromARGB(255, 22, 18, 241)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 30,
                            child: Text(
                              '9:30 AM',
                              style: TextStyle(
                                color: (c2==1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            c1 = 0;
                            c2 = 0;
                            c3 = 1;
                            c4 = 0;
                            c5 = 0;
                            c6 = 0;
                          });
                        }),
                        child: Card(
                          color: (c3 == 1)
                              ? Color.fromARGB(255, 22, 18, 241)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 30,
                            child: Text(
                              '10:00 AM',
                              style: TextStyle(
                                color: (c3==1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            c1 = 0;
                            c2 = 0;
                            c3 = 0;
                            c4 = 1;
                            c5 = 0;
                            c6 = 0;
                          });
                        }),
                        child: Card(
                          color: (c4 == 1)
                              ? Color.fromARGB(255, 22, 18, 241)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 30,
                            child: Text(
                              '10:30 AM',
                              style: TextStyle(
                                color: (c4==1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            c1 = 0;
                            c2 = 0;
                            c3 = 0;
                            c4 = 0;
                            c5 = 1;
                            c6 = 0;
                          });
                        }),
                        child: Card(
                          color: (c5 == 1)
                              ? Color.fromARGB(255, 22, 18, 241)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 30,
                            child: Text(
                              '11:00 AM',
                              style: TextStyle(
                                color: (c5==1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            c1 = 0;
                            c2 = 0;
                            c3 = 0;
                            c4 = 0;
                            c5 = 0;
                            c6 = 1;
                          });
                        }),
                        child: Card(
                          color: (c6 == 1)
                              ? Color.fromARGB(255, 22, 18, 241)
                              : Colors.white,
                          elevation: 8,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 30,
                            child: Text(
                              '11:30 AM',
                              style: TextStyle(
                                color: (c6==1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
