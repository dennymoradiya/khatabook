
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatabook/Database_screen.dart';

class Mainform extends StatefulWidget {
  Mainform({Key? key}) : super(key: key);

  @override
  _MainformState createState() => _MainformState();
}

class _MainformState extends State<Mainform> {
  var LoginDate;
  var SantionDate;
  var DisburdedDate;
  var _selectedStatus = "Success";

  var numberInputFormatters = [
    new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
  ];
  TextEditingController logindatecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController amtcontroller = TextEditingController();
  TextEditingController sanctioncontroller = TextEditingController();
  TextEditingController Disburdedcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Profile',style: TextStyle(fontSize: 25),),
            ),
            
            ListTile(
              title: const Text('Database'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Database()));
                            },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      labelText: "Name",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      hintText: "Bank Person Name",
                    ),
                  ),
                  DateTimePicker(
                    timeLabelText: "Login date",
                    initialValue: '',
                    firstDate: DateTime(1950),
                    lastDate: DateTime((DateTime.now().year) + 1),
                    dateLabelText: 'Choose Login Date',
                    onChanged: (val) => {
                      LoginDate = val,
                      print(LoginDate),
                    },
                  ),
                  TextFormField(
                    controller: amtcontroller,
                    inputFormatters: numberInputFormatters,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Login Amount",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      hintText: "Login Amount",
                    ),
                  ),
                  Row(
                    children: [
                      Text("Status :  "),
                      DropdownButton(
                        value: _selectedStatus,
                        items: <String>["Success", "Failed", "Pending"]
                            .map((String value) {
                          _selectedStatus = value;
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedStatus = newValue.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: sanctioncontroller,
                    inputFormatters: numberInputFormatters,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Sanction Amount",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      hintText: "Bank Person Name",
                    ),
                  ),
                  DateTimePicker(
                    timeLabelText: "Sanction date",
                    initialValue: '',
                    firstDate: DateTime(1950),
                    lastDate: DateTime((DateTime.now().year) + 1),
                    dateLabelText: 'Choose Sanction Date',
                    onChanged: (val) => {
                      SantionDate = val,
                    },
                  ),
                  DateTimePicker(
                    timeLabelText: "Disbursed date",
                    initialValue: '',
                    firstDate: DateTime(1950),
                    lastDate: DateTime((DateTime.now().year) + 1),
                    dateLabelText: 'Choose Disbursed Date',
                    onChanged: (val) => {
                      DisburdedDate = val,
                    },
                  ),
                  TextFormField(
                    controller: Disburdedcontroller,
                    inputFormatters: numberInputFormatters,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Disbursed Amount",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      hintText: "Login Amount",
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          namecontroller.clear();
                          amtcontroller.clear();
                          sanctioncontroller.clear();
                          Disburdedcontroller.clear();
                        });
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
