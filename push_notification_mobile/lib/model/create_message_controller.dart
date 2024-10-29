import 'package:get/get.dart';
import 'package:push_notification_mobile/model/message_model.dart';
import 'package:push_notification_mobile/model/repository.dart';

class CreateMessageController extends GetxController {
  static CreateMessageController get instance => Get.find();

  final controller = Get.put(MessageRepository());

  Future<void> saveMessage(int counter) async {
    try {
      // Start loading

      final newRecord = MessageModel(
          id: '',
          title: 'Hello World $counter',
          body: 'Just  ordered lamborghinoy',
          imageUrl: 'https://printavenue.ph/images/banner.png',
          type: 'kita',
          topic: 'sprinkles',
          link: 'https://printavenue.ph/images/banner.png');

      await MessageRepository.instance.saveMessage(newRecord);

      // Call Repository to create a new Brand
      print('saved!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage(int counter) async {
    try {
      // Start loading

      final newMessage = MessageModel(
          title: 'Hello World $counter',
          body: 'Just  ordered lamborghinoy',
          imageUrl: 'https://printavenue.ph/images/banner.png',
          link: 'https://printavenue.ph/images/banner.png',
          token:
              'f8C8VIRMw4L8Nf0xhZXwGQ:APA91bHA_45JStjEGAlmpB0J9Hv7Guouu53Dq6w2Q8A6vvHG8r7lFdv8M0W1VOsoXUXPPtai23_E67Bdivgia07HXAzKMzY3DEoTdx5vuueJoHc9BSsizdhL9LGhxmG3Z7MHIvSFqy6f',
          topic: 'sprinkles');

      await MessageRepository.instance.sendMessage(newMessage);

      // Call Repository to create a new Brand

      print('sent');
    } catch (e) {
      print(e);
    }
  }
}
