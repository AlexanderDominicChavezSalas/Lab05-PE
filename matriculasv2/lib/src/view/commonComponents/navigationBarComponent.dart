import 'package:flutter/material.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class BarraInferior extends StatelessWidget {
  const BarraInferior({super.key});

  @override
  Widget build(BuildContext context) {
    final pagecontroller = Provider.of<ViewModel>(context);
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              pagecontroller.navigateToEnrollmentPage();
            },
            child: const Text("Perfil")),
        ElevatedButton(
            onPressed: () {
              pagecontroller.navigateToProfilePage();
            },
            child: const Text("Cursos")),
      ],
    );
  }
}
