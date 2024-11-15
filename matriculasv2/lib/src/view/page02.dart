/*
import 'package:flutter/material.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Page02 extends StatefulWidget {
  const Page02({super.key});

  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  // Simulamos un perfil de usuario
  final Map<String, String> userProfile = {
    'Nombre': 'Juan Pérez',
    'Email': 'juan.perez@example.com',
    'Cui': '20173381'
  };

  // Simulamos la lista de cursos inscritos
  List<Map<String, dynamic>> enrolledCourses = [
    {'name': 'Curso de Flutter', 'vacantes': 5},
    {'name': 'Curso de React', 'vacantes': 3}
  ];

  // Función para mostrar el modal de confirmación de desmatriculación
  void _showUnenrollConfirmation(BuildContext context, int courseIndex) {
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
                _unenrollCourse(courseIndex);
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: const Text('Desmatricularse'),
            ),
          ],
        );
      },
    );
  }

  // Función para desmatricularse de un curso y aumentar la vacante
  void _unenrollCourse(int courseIndex) {
    setState(() {
      enrolledCourses[courseIndex]['vacantes'] += 1;
      enrolledCourses.removeAt(courseIndex); // Eliminar curso de la lista
    });
  }

  @override
  Widget build(BuildContext context) {
    final pagecontroller = Provider.of<ViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0), // Espaciado alrededor del título
              child: Center(
                // Centrar el título
                child: Text(
                  "Perfil",
                  style: TextStyle(
                    fontSize: 30, // Tamaño grande
                    fontWeight: FontWeight.bold, // Negrita
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("Nombre: ${userProfile['Nombre']}"),
            Text("Email: ${userProfile['Email']}"),
            Text("CUI: ${userProfile['Cui']}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                pagecontroller
                    .navigateToPage04(); // Ir a la página de inscripción
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 97, 3, 3), // Color de fondo rojo
                foregroundColor: Colors.white, // Color del texto blanco
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
              shrinkWrap:
                  true, // Para que funcione dentro de SingleChildScrollView
              itemCount: enrolledCourses.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      enrolledCourses[index]['name'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                        "Vacantes: ${enrolledCourses[index]['vacantes']}",
                        style: const TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        _showUnenrollConfirmation(context, index);
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
}
*/