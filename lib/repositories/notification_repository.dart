import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as dev;
import '../config/onesignal_config.dart';
import '../model/notification_model.dart';
import 'package:http/http.dart' as http;
class NotificationRepository {
  NotificationRepository(
      {FirebaseFirestore? firestore, FirebaseAuth? firebaseAuth})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  Future<void> sendPushNotification(
      String notificationContents,
      String notificationTitle,
      List<String> listOfToken,
      ) async {
    try {
      var url = Uri.parse(OneSignalConfig.oneSignalApiUrl);
      var client = http.Client();
      var headers = {
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Basic ${OneSignalConfig.restApiKey}",
      };
      var body = {
        "app_id": OneSignalConfig.oneSignalAppId,
        "contents": {"en": notificationContents},
        // "included_segments": listOfToken,
        "include_external_user_ids": listOfToken,
        "headings": {"en": notificationTitle},
        "priority": "HIGH",
        "small_icon":
        'https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png',
      };
      var response =
      await client.post(url, headers: headers, body: json.encode(body));
      if (response.statusCode == 200) {
        dev.log("Notification is send Successfully ${response.body} ",
            name: 'Notification');
      } else {
        dev.log("Got errors : ${response.body}", name: "Notification");
      }
    } catch (e) {
      dev.log("Got errors : $e", name: "Notification");
    }
  }

  Future<void> addNotification(NotificationModel notification) async {
    return await _firestore
        .collection('users')
        .doc(notification.userId)
        .collection('notifications')
        .doc(notification.timeStamp.toString())
        .set(notification.toMap());
  }

  Stream<List<NotificationModel>> getNotification() {
    return _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.phoneNumber.toString())
        .collection('notifications')
        .orderBy(
          'timeStamp',
          descending: true,
        )
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => NotificationModel.fromMap(e.data()))
          .toList();
    });
  }
}
