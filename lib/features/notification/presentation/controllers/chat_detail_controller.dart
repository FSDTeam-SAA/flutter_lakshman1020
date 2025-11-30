import 'package:get/get.dart';
import 'package:flutter_lakshman1020/core/network/services/auth_storage_service.dart';
import 'package:flutter_lakshman1020/features/chat/data/chat_repository.dart';
import 'package:flutter_lakshman1020/features/chat/data/models/chat_model.dart';

class ChatDetailController extends GetxController {
  final ChatRepository _chatRepository = ChatRepository();
  final AuthStorageService _authStorageService = AuthStorageService();

  var chatModel = Rxn<ChatModel>();
  var isLoading = false.obs;
  var currentUserId = ''.obs;
  final messageInput = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentUserId();
  }

  Future<void> _loadCurrentUserId() async {
    final userId = await _authStorageService.getUserId();
    currentUserId.value = userId ?? '';
    print('🔑 Current User ID: ${currentUserId.value}');
  }

  Future<void> fetchChatDetails(String chatId) async {
    isLoading.value = true;
    print('📡 Fetching chat details for: $chatId');

    // Ensure user ID is loaded
    if (currentUserId.value.isEmpty) {
      await _loadCurrentUserId();
    }

    final result = await _chatRepository.fetchSingleChat(chatId);
    result.fold(
      (failure) {
        print('❌ Failed to fetch chat: ${failure.message}');
        Get.snackbar('Error', 'Failed to load chat');
        isLoading.value = false;
      },
      (chat) {
        print('✅ Loaded chat with ${chat.messages.length} messages');
        chatModel.value = chat;
        isLoading.value = false;
      },
    );
  }

  bool isMyMessage(ChatMessageModel message) {
    return message.user.id == currentUserId.value;
  }
}
