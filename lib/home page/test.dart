import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String? selectedGender;

  final formKey = GlobalKey<FormState>();

  bool? selected =false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'xx',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                'xx@example.com',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              RadioMenuButton(
                value: 'selected',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    
                  selectedGender = value;
                  });
                },
                child: Text('Male'),
              ),
              RadioMenuButton(
                value: 'Gender',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    
                  selectedGender = value;
                  });
                },
                child: Text('Female'),
              ),
              Checkbox(
                value: selected,
                checkColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                  selected = value!;  
                  });
                },
              ),
              Row(
                children: <Widget>[
                  Radio<String>(
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        
                      selectedGender = value;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                      selectedGender = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
