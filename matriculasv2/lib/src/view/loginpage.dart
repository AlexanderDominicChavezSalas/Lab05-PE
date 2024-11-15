import 'package:flutter/material.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pagecontroller = Provider.of<ViewModel>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 184, 244),
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: pagecontroller.emailcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Obligatorio';
                }
                return null;
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintText: "Correo de usuario",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            TextFormField(
              controller: pagecontroller.passwordcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Obligatorio';
                }
                return null;
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintText: "Contraseña",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  pagecontroller.login();
                }
              },
              child: const Center(
                  child: SizedBox(
                      width: 400, height: 55, child: Text("Ingresar"))),
            )
          ],
        ),
      ),
    );
  }
}
