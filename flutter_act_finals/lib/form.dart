import 'package:flutter/material.dart';
//Code By: Gwyneth Escabusa
//Section: BSIT3R6
class Form_handle extends StatefulWidget {
  const Form_handle({Key? key}) : super(key: key);

  @override
  State<Form_handle> createState() => _Form_handleState();
}
class _Form_handleState extends State<Form_handle> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Handling"),
    ),
      body: Form(
        key: GlobalKey<FormState>(),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Username")
              ),
              ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password")
              ),
            ),
            SizedBox(height:15),
            ElevatedButton(onPressed: (){
              print("Welcome to Dashboard");
            },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}