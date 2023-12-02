import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:blood_fighter/authenticaiton%20feature/model/user_model.dart';
import 'package:blood_fighter/blood%20request%20feature/model/blood_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BloodRequestRepo {
  static final FirebaseFirestore _database = FirebaseFirestore.instance;
  static String collectionUser = 'Blood Requests';
  final List<UserModel> users = [];

  static Future<void> addRequest(BloodRequestModel requestModel) async {
    _database
        .collection(collectionUser)
        .doc(requestModel.name)
        .set(requestModel.toMap())
        .catchError((e) => debugPrint(e.toString()));
  }

  static Future<List<BloodRequestModel>> getRequestedPostData() async {
    final querySnapshot = await _database.collection(collectionUser).get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((docSnapshot) => BloodRequestModel.fromSnapshot(docSnapshot))
          .toList();
    } else {
      return [];
    }
  }

  // static Future<List<UserModel>> getDonorListForNotificaiton(
  //     String location, String bloodGroup) async {
  //   final querySnapshot = await _database
  //       .collection(collectionUser)
  //       .where('bloodgroup', isEqualTo: bloodGroup)
  //       .get();
  //       // return querySnapshot.docs
  //       //   .map((docSnapshot) => UserModel.fromSnapshot())
  //       //   .toList();
  // }

  // sending push notifications
  static Future<void> sendNotifications(List<String> tokens) async {
    try {
      for (var element in tokens) {
        final body = {
          "to": element,
          "notification": {
            "title": 'me.name', //our name should be send
            "body": 'msg',
            "android_channel_id": "chats"
          },
        };
        var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader:
                  'key=AAAAafoF3F0:APA91bGm6laGflucG7oF5V9iTyMOjPmYApyqtwkGt48HK4N1cuC3KtcHF4iGvR0ou0B9YyUxE8MuZqRjT5OxYtW0cZfm4NgUo27d9TrJ_g-z4xkkeUrJdVsv72EHa9VXFJzNa1s1eC1a'
            },
            body: jsonEncode(body));
      }
    } catch (e) {
      log('\nsendPushNotificationE: $e');
    }
  }
}
