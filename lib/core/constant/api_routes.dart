/// List of api end points
class ApiRoutes {
  ApiRoutes._();

  static String base_url = 'http://44.212.230.27:8000/';
  static String v1 = 'api/v1';
  static String base = base_url + v1;

  static String doctors = '$base/doctors';
  static String clinics = '$base/clinic';
  static String specializations = '$base/specialization';
  //static String related_movie = '$base/movies/id?lang=en';

  static String doctor(String? id) => '$base/doctors/$id';

  static String clinic(String? id) => '$base/clinic/$id';
  static String specialization(String? id) => '$base/specialization/$id';
  static String review(String? id) => '$base/doctors/$id/review';
}
