import 'dart:convert';
import 'dart:developer';

import 'package:credo_engage/core/models/auto_generate.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/services/base_api.dart';

class AutoGenerateProvider with ChangeNotifier {
  bool isLoading = false;

  String retrievedPost = '';

  getHashtagFromPost(String searchPost) async {
    showLoading();
    var response = await connect("/stats/auto-hashtag?post=$searchPost");

    if (response.statusCode == 200) {
      var parsedData = AutoGenerate.fromJson(json.decode(response.body));
      log('parsedData: ${parsedData.post}');
      retrievedPost = parsedData.post;

      hideLoading();
      notifyListeners();
    } else {
      throw Exception('Failed to load post');
    }
  }

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
