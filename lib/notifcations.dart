import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
FirebaseAnalytics analytics = FirebaseAnalytics.instance;
Future<void> handleBackgroundMessage(RemoteMessage message)async{
  print('Title:${message.notification?.title}');
  print('Title:${message.notification?.body}');
}
class FirebaseApi{
  final _firebaseMessaging=FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmtoken=await _firebaseMessaging.getToken();
    print('token:$fcmtoken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
  }