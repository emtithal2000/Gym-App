import 'dart:convert';
import 'dart:developer';

import 'package:first_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchData extends ChangeNotifier {
  UserModel? user;

  void fetchData(String id) async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://graduation-98aae-default-rtdb.firebaseio.com/Users/$id.json',
        ),
      );
      var jsonString = jsonDecode(response.body);
      user = UserModel.fromJson(jsonString);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
