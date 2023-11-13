
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class NotificationService {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   NotificationService() {
//     _initializeFirebaseMessaging();
//   }
//   void _initializeFirebaseMessaging() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     print('Firebase Messaging Token: $fcmToken');
//   }

//   Future<void> sendNotificationToUsers({
//     required String recipientTokens,
//     required String title,
//     required String body,
//   }) async {

//         await _firebaseMessaging.sendMessage(
//           to: recipientTokens,
//           data: <String, String>{
//             'title': title,
//             'body': body,
//           },
//         );

//       }
  
// }
//   Future<void> sendPushNotification(String title, String body) async {
//     // Construct the notification payload
//     final message = {
//       'notification': {
//         'title': title,
//         'body': body,
//       },
//       'registration_ids': 'dBwEN-FOTEGNYllQlKiwNn:APA91bGx5q2zxrPQp4MYV_yicI1P5Qo5cdatXySRUaF-aUxivHnvPyVJIhNo_G4bC7b34BO_Z_KDJCM4iF-g2gFlRuyTZ9yzfYOhfxK3JZn9OcsfHGnWVOvsvvK3vXRm4u6Ngz2TndLK',
//     };

//     // Use your FCM server key here
//     const String serverKey = 'AAAAafoF3F0:APA91bGm6laGflucG7oF5V9iTyMOjPmYApyqtwkGt48HK4N1cuC3KtcHF4iGvR0ou0B9YyUxE8MuZqRjT5OxYtW0cZfm4NgUo27d9TrJ_g-z4xkkeUrJdVsv72EHa9VXFJzNa1s1eC1a';

//     // Send the notification to FCM
//     final response = await post(
//       Uri.parse('https://fcm.googleapis.com/fcm/send'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Authorization': 'key=$serverKey',
//       },
//       body: jsonEncode(message),
//     );
//     // Check the response and handle accordingly
//     if (response.statusCode == 200) {
//       debugPrint('Notification sent successfully');
//     } else {
//       debugPrint(
//           'Failed to send notification. Status code: ${response.statusCode}');
//     }
//   }
// }

//   void sendBloodRequestNotifications() async {
//     await NotificationService().sendNotificationToUsers(
//       recipientTokens: 'dBwEN-FOTEGNYllQlKiwNn:APA91bGx5q2zxrPQp4MYV_yicI1P5Qo5cdatXySRUaF-aUxivHnvPyVJIhNo_G4bC7b34BO_Z_KDJCM4iF-g2gFlRuyTZ9yzfYOhfxK3JZn9OcsfHGnWVOvsvvK3vXRm4u6Ngz2TndLK',
//       title: 'Blood Request',
//       body: 'Someone needs your blood type!',
//     );
//   }

//   Future<List<String>> getMatchingUserTokens(String bloodgroup) async {}

// class NotificationService {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   NotificationService() {
//     Initialize Firebase Messaging
//     _initializeFirebaseMessaging();
//   }

//   void _initializeFirebaseMessaging() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmToken = await _firebaseMessaging.getToken();
//     print('Firebase Messaging Token: $fcmToken');
//   }

//   Future<void> sendNotificationToUsers({
//     required List<String> recipientTokens,
//     required String title,
//     required String body,
//   }) async {
//     try {
//       await _firebaseMessaging.(
//         messages: recipientTokens.map((token) => _buildMessage(token, title, body)).toList(),
//       );
//     } catch (e) {
//       print('Error sending notification: $e');
//     }
//   }

//   RemoteMessage _buildMessage(String token, String title, String body) {
//     return RemoteMessage(
//       data: <String, String>{
//         'title': title,
//         'body': body,
//       },
//       to: token,
//     );
//   }
// }