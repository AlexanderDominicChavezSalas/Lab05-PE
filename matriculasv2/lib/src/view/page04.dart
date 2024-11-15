
/*
class Page04 extends StatefulWidget {
  const Page04({super.key});

  @override
  State<Page04> createState() => _Page04State();
}

class _Page04State extends State<Page04> {
  Future<List<Course>>? _courseList;
  Student student = Student(
    id: 1,
    name: "Alexander Dominic Chavez Salas",
    cui: "20173381",
    email: "achavezsa@unsa.edu.pe",
    password: "12345678",
  );

  List<Enrollment> enrollments = [];

  Future<List<Course>> _getCourses() async {
    // Simulate a delay to load courses
    await Future.delayed(const Duration(seconds: 2));

    // List of simulated courses with vacancies and description
    List<Course> courses = [
      Course(
        id: 1,
        code: "1233213",
        name: "Emerging Platforms",
        shift: Shift(
          teacher: "Ing Calienes",
          schedule: "Mon(8:50-10:40)_Wed(10:40-14:00)",
          letter: "A",
        ),
        description:
            "This course covers emerging platforms and how to apply them in software development.",
        vacancies: 5,
      ),
      Course(
        id: 2,
        code: "9876543",
        name: "Web Development",
        shift: Shift(
          teacher: "Ing Pérez",
          schedule: "Tue(8:00-9:40)_Thu(10:00-12:00)",
          letter: "B",
        ),
        description:
            "Learn to develop web applications from scratch using the latest technologies.",
        vacancies: 0,
      ),
      Course(
        id: 3,
        code: "4567890",
        name: "Artificial Intelligence",
        shift: Shift(
          teacher: "Ing Quispe",
          schedule: "Fri(8:00-10:00)",
          letter: "C",
        ),
        description:
            "This course introduces concepts of artificial intelligence and machine learning.",
        vacancies: 3,
      ),
    ];

    return courses;
  }

  @override
  void initState() {
    super.initState();
    _courseList = _getCourses();
  }

  bool _isEnrolled(int courseId) {
    return enrollments.any((enrollment) => enrollment.courseId == courseId);
  }

  void _enrollStudent(Course course) {
    setState(() {
      enrollments.add(Enrollment(
        id: enrollments.length + 1,
        studentId: student.id,
        studentCUI: student.cui,
        courseId: course.id,
      ));
      course.vacancies--; // Decrease vacancies
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Course>>(
        future: _courseList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              // Add scrolling if content is long
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0), // Spacing around the title
                    child: Center(
                      // Center the title
                      child: Text(
                        "Enrollment",
                        style: TextStyle(
                          fontSize: 30, // Large size
                          fontWeight: FontWeight.bold, // Bold
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap:
                        true, // Allows ListView to take only necessary space
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Course course = snapshot.data![index];
                      bool enrolled = _isEnrolled(course.id);

                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            "${course.name} (Shift ${course.shift.letter})",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Code: ${course.code}\nTeacher: ${course.shift.teacher}",
                          ),
                          trailing: ElevatedButton(
                            onPressed: (course.vacancies > 0 && !enrolled)
                                ? () {
                                    _showEnrollmentModal(context, course);
                                  }
                                : null, // Disable button if vacancies are 0 or already enrolled
                            child: Text(enrolled
                                ? "Enrolled"
                                : (course.vacancies > 0
                                    ? "Enroll"
                                    : "No Vacancies")),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text("No courses available."));
        },
      ),
    );
  }

  void _showEnrollmentModal(BuildContext context, Course course) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Enroll in ${course.name}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                course.description,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Schedule:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(course.shift.schedule.replaceAll("_", "\n")),
                    const SizedBox(height: 10),
                    Text("Group: ${course.shift.letter}"),
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
                backgroundColor: const Color.fromARGB(
                    255, 128, 8, 0), // Red background color
                foregroundColor: Colors.white, // White text color
              ),
              onPressed: course.vacancies > 0
                  ? () {
                      _enrollStudent(course);
                      Navigator.of(context).pop();
                    }
                  : null, // Disable if no vacancies
              child: Text(
                  course.vacancies > 0 ? "Confirm Enrollment" : "No Vacancies"),
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
*/