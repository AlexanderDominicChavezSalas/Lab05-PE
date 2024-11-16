//loginpage.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';

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
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 97, 3, 3),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkKGnYpNgEG4POueCPXV_RNQ42tSzTS0kHv4IYZKneE8lwBr0H26iwkUZKbHwcgpUlrLU&usqp=CAU',
                  height: 70,
                ),
                const SizedBox(width: 10),
                const Text(
                  "MATRICULAS LABS - 2024",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "INGRESO DEL ALUMNO",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 97, 3, 3),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Image.network(
                          'https://images.emojiterra.com/microsoft/fluent-emoji/1024px/1f512_color.png',
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: pagecontroller.emailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Ingrese su Usuario",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: pagecontroller.passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Ingrese su contraseña",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.lock),
                          label: const Text("Aceptar"),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 97, 3, 3),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              pagecontroller.login();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Universidad Nacional de San Agustín de Arequipa",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
