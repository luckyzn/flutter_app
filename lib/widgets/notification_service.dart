import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> iniciarNotifications() async{
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse:(NotificationResponse notificationResponse) async{});
  }

notificationDetails(){
  return const NotificationDetails(
    android: AndroidNotificationDetails('channelId', 'channelName', icon: '@mipmap/ic_launcher',importance: Importance.high)
  );
}

Future showNotification(
  {int id = 0,String? title, String? body, String? payload}) 
    async{
      return notificationsPlugin.show(id, title, body, await notificationDetails());
    }
}