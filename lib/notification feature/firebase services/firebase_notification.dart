
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);
  }
}
