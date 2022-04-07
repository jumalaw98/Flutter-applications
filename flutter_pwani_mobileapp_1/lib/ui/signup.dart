import 'package:flutter/material.dart';
import 'package:flutter_pwani_mobileapp_1/ui/login.dart';
import 'package:flutter_pwani_mobileapp_1/ui/view_courses.dart';
import 'package:flutter_pwani_mobileapp_1/ui/widgets/btn.dart';
import 'package:flutter_pwani_mobileapp_1/ui/widgets/txt_field.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String _currentSelectedValue;

  @override
  void initState() {
    _currentSelectedValue = 'Mentee';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _selectType = [
      "Mentee",
      "Mentor/Teacher",
    ];

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/signup2.png"))),
              ),
              SizedBox(height: 18),
              Text("Welcome to Pwani Teknowgalz Courses! \n\nCreate Account",
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 30),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      //labelStyle: textStyle,
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Mentor or mentee?',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 16.0, top: 16.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    //isEmpty: _currentSelectedValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            _currentSelectedValue = newValue!;
                            state.didChange(newValue);
                          });
                        },
                        items: _selectType.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                          }).toList(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              TxtField(
                  hintText: "Full names",
                  inputType: TextInputType.text,
                  obscureText: false),
              SizedBox(height: 16),
              TxtField(
                  hintText: "Email",
                  inputType: TextInputType.emailAddress,
                  obscureText: false),
              SizedBox(height: 16),
              TxtField(
                  hintText: "Password",
                  inputType: TextInputType.text,
                  obscureText: true),
              SizedBox(height: 20),
              Btn(
                  text: "Register",
                  onPressed: () {
                    Get.to(() => ViewCourses());
                  }),
                  SizedBox(height: 25),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(() => Login());
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Login',
                              style: TextStyle(
                                  color: Color.fromRGBO(230, 88, 62, 1),
                                  fontSize: 16))
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

