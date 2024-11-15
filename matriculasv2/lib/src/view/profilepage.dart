import 'package:flutter/material.dart';
import 'package:matriculasv2/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pagecontroller = Provider.of<ViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 184, 244),
      appBar: AppBar(
        title: const Text("ProfilePage"), //page02
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          pagecontroller.navigateToEnrollmentPage();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Text("Nombre"),
          Text(pagecontroller.studentLogged.name.toString()),
          const Text("Email"),
          Text(pagecontroller.studentLogged.email.toString()),
          const Text("CUI"),
          Text(pagecontroller.studentLogged.cui.toString()),
          const SizedBox(width: 20),
          const Text("Cursos a los que el estudiante esta inscrito"),
          ListView.builder(
              itemCount: pagecontroller.EnrolledCourses.length,
              //itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, i) {
                return ListTile(
                  tileColor: Colors.white,
                  title: Text(pagecontroller.EnrolledCourses[i].course!.name
                      .toString()),
                  subtitle: Text(pagecontroller
                      .EnrolledCourses[i].course!.shift!.teacher
                      .toString()),
                  trailing: PopupMenuButton(
                    child: const Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem(
                          value: 'delete', child: Text("Borrar"))
                    ],
                    onSelected: (String value) {
                      if (value == "delete") {
                        pagecontroller.deleteEnrollment(
                            pagecontroller.EnrolledCourses[i].id.toString(), i);
                      }
                    },
                  ),
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
                ElevatedButton(
                    onPressed: () {
                      pagecontroller.navigateToLoginPage();
                    },
                    child: const Text("Logout")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
