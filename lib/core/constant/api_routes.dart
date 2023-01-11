
/// List of api end points
class ApiRoutes {
  ApiRoutes._();

  static String base = 'https://jsonplaceholder.typicode.com';

  static String posts = '$base/posts';

  static String todos = '$base/todos';

  static String post(String? id) => '$base/post/$id';

  static String todo(String? id) => '$base/todo/$id';

}
