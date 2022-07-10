import 'package:asky/services/auth_services.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: usernameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(children: [
                    const Center(child: Text("don't have an account")),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("signup");
                      },
                      child: const Text(
                        "sgin up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    AuthService().signInWithEmail(usernameController.text,
                        passwordController.text, context);
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(color: Colors.black),
                const Text("contuniue with"),
                IconButton(
                    onPressed: () {
                      AuthService().signInwithGoogle();
                    },
                    icon: Icon(Icons.mail))
              ],
            )),
          )
        ]),
      ),
    );
  }
}
