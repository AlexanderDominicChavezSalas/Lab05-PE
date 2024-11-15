import 'package:flutter/material.dart';
import 'package:matriculasv2/helper/navigator.dart';
import 'package:matriculasv2/helper/network.dart';
import 'package:matriculasv2/src/model/models.dart';
import 'package:matriculasv2/src/view/enrollmentpage.dart';
import 'package:matriculasv2/src/view/loginpage.dart';
import 'package:matriculasv2/src/view/profilepage.dart';

class ViewModel extends ChangeNotifier {
  final NavigationService _navigationService;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Student studentLogged = Student(
      id: 0,
      name: "",
      email: "",
      cui: "",
      password: ""); //inicializamos el estudiante logueado
  List<Enrollment> EnrolledCourses = [];
  List<Course> AllCourses = [];
  ViewModel(this._navigationService) {
    getAllCourses();
  }

  navigateToEnrollmentPage() {
    _navigationService.navigate(const EnrollmentPage());
  }

  navigateToProfilePage() {
    getEnrolledCourses();
    _navigationService.navigate(const ProfilePage());
  }

  navigateToLoginPage() {
    //esto es basicamente el logout
    _navigationService.navigate(const LoginPage());
    emailcontroller.clear(); //borramos el texto del correo
    passwordcontroller.clear(); //borramos el texto de la contraseña
    studentLogged = Student(
        id: 0,
        name: "",
        email: "",
        cui: "",
        password: ""); //limpiamos la info del estudiante
    EnrolledCourses = [];
    //aqui borrar la info de login y las constantes
  }

  login() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().post('/login',
        {"email": emailcontroller.text, "password": passwordcontroller.text});

    if (resData != null) {
      // Crea el objeto Student desde el JSON
      studentLogged = Student.fromJson(resData);
      getEnrolledCourses();
      _navigationService.navigate(const ProfilePage());

      //emailcontroller.clear(); // Para el logout
    } else {
      print("Credenciales incorrectas");
    }
  }

  getEnrolledCourses() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().get('/enrollments/${studentLogged.cui}');
    EnrolledCourses =
        resData.map<Enrollment>((item) => Enrollment.fromJson(item)).toList();
    _navigationService.goBack(); //sirve para q no se quede cargando
    notifyListeners();
  }

  getAllCourses() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().get('/courses');
    AllCourses = resData.map<Course>((item) => Course.fromJson(item)).toList();
    _navigationService.goBack(); //sirve para q no se quede cargando
    notifyListeners();
  }

  enrollCourse(int? courseId) async {
    if (courseId == null || studentLogged.id == null) {
      print("CourseId o studentLogged.id es null");
      return;
    }

    try {
      _navigationService.showLoader();

      // Convierte a int si es necesario
      final studentId = studentLogged.id is int
          ? studentLogged.id
          : int.parse(studentLogged.id.toString());

      var resData = await ApiProvider().post('/enrollments', {
        "studentId": studentId, // ID del estudiante como entero
        "studentCUI": studentLogged.cui.toString(), // CUI del estudiante
        "courseId": courseId.toInt() // CourseId como entero
      });

      if (resData != null) {
        _navigationService.goBack();
        _navigationService.navigate(const EnrollmentPage());
      } else {
        print("Algo salió mal y no se matriculó");
      }
    } catch (e) {
      print("Error al intentar matricular al curso: $e");
    }
  }

  deleteEnrollment(id, index) async {
    _navigationService.showLoader();
    var resData = await ApiProvider().delete('/enrollments/' + id);
    _navigationService.goBack();
    if (resData != null) {
      EnrolledCourses.removeAt(index);
      notifyListeners();
    } else {
      print("Algo salió mal y no se desmatriculó");
    }
  }
}
