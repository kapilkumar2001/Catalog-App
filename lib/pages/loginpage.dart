import 'package:flutter/material.dart';
import 'package:catalog_app2/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  String name= "";
  bool changedbutton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome (BuildContext context) async
  {
    if(_formKey.currentState.validate()){
    setState(() {
      changedbutton=true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.listRoute);
    setState(() {
      changedbutton=false;
    });}
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Image.asset("assets/images/login.png"),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: context.accentColor,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0,),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value.isEmpty) {
                          return "Password can't be empty";
                        }
                        else if(value.length<6)
                          {
                            return "Password length should be atleast 6";
                          }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: changedbutton?50:150,
                  height: 50,
                  alignment: Alignment.center,
                  child: changedbutton?Icon(Icons.done,color: Colors.white,):Text(
                    "login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changedbutton?50:8),
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
