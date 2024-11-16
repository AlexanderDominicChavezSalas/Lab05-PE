import 'package:flutter/material.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              pageController.navigateToLoginPage();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Perfil",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("Nombre: ${pageController.studentLogged.name}"),
            Text("Email: ${pageController.studentLogged.email}"),
            Text("CUI: ${pageController.studentLogged.cui}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                pageController.navigateToEnrollmentPage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 97, 3, 3),
                foregroundColor: Colors.white,
              ),
              child: const Text("Inscribirse a un curso"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Cursos Inscritos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pageController.EnrolledCourses.length,
              itemBuilder: (context, index) {
                final course = pageController.EnrolledCourses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      course.course!.name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Profesor: ${course.course!.shift!.teacher}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        _showUnenrollConfirmation(
                            context, pageController, index);
                      },
                    ),
                    tileColor: const Color.fromARGB(255, 97, 3, 3),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUnenrollConfirmation(
      BuildContext context, ViewModel pageController, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Desmatriculación'),
          content: const Text('¿Estás seguro de que deseas desmatricularte?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                pageController.deleteEnrollment(
                    pageController.EnrolledCourses[index].id.toString(), index);
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: const Text('Desmatricularse'),
            ),
          ],
        );
      },
    );
  }
}
