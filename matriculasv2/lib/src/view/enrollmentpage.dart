import 'package:flutter/material.dart';
import 'package:matriculasv2/src/model/models.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class EnrollmentPage extends StatelessWidget {
  const EnrollmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enrollment"),
      ),
      body: EnrollmentView(
        courses: pageController.AllCourses,
        onEnroll: (course) {
          _showEnrollmentModal(context, course, pageController);
        },
        isEnrolled: (courseId) {
          return pageController.isEnrolled(courseId);
        },
      ),
    );
  }

  void _showEnrollmentModal(
      BuildContext context, Course course, ViewModel pageController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              course.name ?? "No name avaiable",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Description:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(course.description ?? "No description available",
                  textAlign: TextAlign.justify),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    const Text("Schedule:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(course.shift?.schedule?.replaceAll("_", "\n") ??
                        "No schedule available"),
                    const SizedBox(height: 10),
                    Text("Group: ${course.shift!.letter}"),
                    const SizedBox(height: 10),
                    Text("Available vacancies: ${course.vacancies}"),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 128, 8, 0),
                foregroundColor: Colors.white,
              ),
              onPressed: (course.vacancies ?? 0) > 0
                  ? () {
                      pageController.enrollCourse(course.id!);
                      Navigator.of(context).pop();
                    }
                  : null,
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

class EnrollmentView extends StatelessWidget {
  final List<Course> courses;
  final void Function(Course course) onEnroll;
  final bool Function(int courseId) isEnrolled;

  const EnrollmentView({
    super.key,
    required this.courses,
    required this.onEnroll,
    required this.isEnrolled,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Cursos disponibles",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              final enrolled = isEnrolled(course.id!);

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    "${course.name ?? "No Name"} (Shift ${course.shift?.letter ?? "N/A"})",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Code: ${course.code ?? "No Code"}\nTeacher: ${course.shift?.teacher ?? "No Teacher"}",
                  ),
                  trailing: ElevatedButton(
                    onPressed: ((course.vacancies ?? 0) > 0 && !enrolled)
                        ? () => onEnroll(course)
                        : null,
                    child: Text(
                      enrolled
                          ? "Enrolled"
                          : ((course.vacancies ?? 0) > 0
                              ? "Enroll"
                              : "No Vacancies"),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
