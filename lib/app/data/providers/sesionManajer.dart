// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  String? token;

  Future<void> saveSessions(String? thisToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', thisToken ?? "");
  }

  Future getSessions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return token;
  }

  Future<void> clearSessions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

final session = SessionManager();
