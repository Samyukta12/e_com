import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: email,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your email",
                        labelText: "Email",
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    // validator: (value){
                    //   // if(password.text.isNotEmpty&&password.text.contains(l)){ }
                    // },
                    controller: password,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your password",
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap:(){},
                        child: Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                GestureDetector(
                    onTap:(){},
                    //     (){
                    //   if(controller.text.isNotEmpty&& password.text.isNotEmpty){
                    //     print('succesfully signup');
                    //   }
                    //   else{
                    //     print("shshshhshshs");
                    //   }
                    // },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.72,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  child: Center(child: Text("or")),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 12, bottom: 12),
                    child: Center(child: Text("Login with")),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.google),
                      Icon(FontAwesomeIcons.facebook)
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Center(
                              child: Text(
                                "Already a user?/",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
