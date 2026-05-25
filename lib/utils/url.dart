class Urls{
  static String _baseURL = 'https://task-manager-api.ostad.live/api/v1';
  static String signUpUrl = '$_baseURL/Registration';
  static String signInUrl = '$_baseURL/Login';
  static String getTaskCountURL = '$_baseURL/taskStatusCount';
  static String createtaskURL = '$_baseURL/createTask';
  static String updateProfileURL = '$_baseURL/ProfileUpdate';
  static String taskByStatusURL(String status) => '$_baseURL/listTaskByStatus/$status';
  static String taskDeleteURL(String id) => '$_baseURL/deleteTask/$id';
  static String taskStatusUpdateURL(String taskId, String status) => '$_baseURL/updateTaskStatus/$taskId/$status';
}