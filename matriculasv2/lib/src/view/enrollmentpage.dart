import 'package:flutter/material.dart';
import 'package:matriculasv2/src/model/models.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class EnrollmentPage extends StatelessWidget {
  const EnrollmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pagecontroller = Provider.of<ViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 184, 244),
      appBar: AppBar(
        title: const Text("EnrollmentPage"), //page04
      ),
      body: Column(
        children: [
          const Text("Cursos disponibles"),
          ListView.builder(
              itemCount: pagecontroller.AllCourses.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, i) {
                return ListTile(
                  tileColor: Colors.white,
                  title: Text(pagecontroller.AllCourses[i].name.toString()),
                  subtitle: Text(
                      pagecontroller.AllCourses[i].shift!.teacher.toString()),
                  leading: Text(pagecontroller.AllCourses[i].code.toString()),
                  trailing: ElevatedButton(
                      onPressed: () {
                        _showEnrollmentModal(context,
                            pagecontroller.AllCourses[i], pagecontroller);
                      },
                      child: const Text("Matricular")),
                );
              }),
          Container(
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      pagecontroller.navigateToProfilePage();
                    },
                    child: const Text("Perfil")),
                ElevatedButton(
                    onPressed: () {
                      pagecontroller.navigateToEnrollmentPage();
                    },
                    child: const Text("Cursos")),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showEnrollmentModal(
      BuildContext context, Course course, ViewModel pagecontroller) {
    int? id = course.id;
    String name = course.name.toString();
    String description = course.description.toString();
    String schedule = course.shift!.schedule.toString();
    String letter = course.shift!.letter.toString();
    String vacancies = course.vacancies.toString();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Descripcion del curso",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(description),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Horario del curso",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(schedule),
                    const SizedBox(height: 10),
                    Text("Grupo: $letter"),
                    const SizedBox(height: 10),
                    Text("Vacantes disponibles: $vacancies"),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 128, 8, 0), // Red background color
                foregroundColor: Colors.white, // White text color
              ),
              onPressed: () {
                pagecontroller.enrollCourse(id);
              }, // Disable if no vacancies
              child: const Text("Confirm Enrollment"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
