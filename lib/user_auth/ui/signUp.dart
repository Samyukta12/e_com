import 'package:e_com/constant/color_constant.dart';
import 'package:e_com/dashboard/home.dart';
import 'package:e_com/user_auth/ui/siginui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 180.0, left: 45),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const Center(
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
                  padding: const EdgeInsets.all(8.0),
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
                        onTap: () {},
                        child: const Icon(Icons.visibility),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.72,
                      decoration: BoxDecoration(
                          color: ColorConstant.redColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 1),
                  child: const Center(child: Text("or")),
                ),
                Divider(
                  thickness: 2,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
                    child: const Center(child: Text("Login with")),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.google),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.facebook),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        "Already a user?/",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: const Text(
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
