import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://67c68596351c081993fd9c0f.mockapi.io';  // Replace with your actual mockapi.io base URL
  static const String endpoint = '/users';  // This should match the resource name you created on mockapi.io

  // Fetch all users
  static Future<List<Map<String, dynamic>>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to fetch users from API');
    }
  }

  // Fetch a single user by ID
  static Future<Map<String, dynamic>> fetchUserById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  // Add a new user
  static Future<Map<String, dynamic>> addUser(Map<String, dynamic> user) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to add user');
    }
  }

  // Update existing user by ID
  static Future<Map<String, dynamic>> updateUser(String id, Map<String, dynamic> user) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user');
    }
  }

  // Delete user by ID
  static Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
