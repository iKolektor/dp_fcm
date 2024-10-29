import 'package:get/get.dart';
import 'package:push_notification_mobile/http/http_client.dart';
import 'package:push_notification_mobile/model/message_model.dart';


class MessageRepository extends GetxController {
  static MessageRepository get instance => Get.find();

  var messageList = <MessageModel>[].obs;
  var isLoading = true.obs;

  Future<void> saveMessage(MessageModel data) async {
    try {
      await THttpHelper.post('fcm/insert_message.php', data.toJson(), true, false);
    } catch (e) {
      print('saved to database');
    }
  }

  Future<void> sendMessage(MessageModel data) async {
    try {
      await THttpHelper.post('fcm/send_message.php', data.toSend(), true, false);
    } catch (e) {
     print('send to destination');
    }
  }
}
