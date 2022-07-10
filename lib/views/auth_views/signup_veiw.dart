import 'package:asky/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: [
      //       Color.fromARGB(255, 103, 10, 119),
      //       Color.fromARGB(255, 224, 118, 19)
      //     ])),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Image.asset("images/logo.png"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "username",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: mailController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)))),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      const Center(child: Text("Already have an account")),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("login");
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthService().signUpWithEmail(mailController.text,
                          passwordController.text, context);
                    },
                    child: const Text(
                      "SGIN UP",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )),
            )
          ]),
        ),
      ),
    );
  }
}
