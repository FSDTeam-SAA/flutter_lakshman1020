import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import '../data/message_repository.dart';
import '../data/models/message_model.dart';

class MessageController extends GetxController {
  final MessageRepository _repository = MessageRepository();
  final box = GetStorage();
  late String currentUserId;

  var messages = <MessageModel>[].obs;
  var messageInput = ''.obs;
  var isSending = false.obs;
  late String chatId;

  /// Scroll controller for auto-scroll
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // Initialize currentUserId from storage if available, else use default
    // In production, fetch from auth service
    try {
      currentUserId = box.read('currentUserId') ?? 'default_user_id';
    } catch (_) {
      currentUserId = 'default_user_id';
    }
  }

  void init(String id) {
    chatId = id;

    // Load cached messages first for instant UX (offline-first)
    final cached = box.read<List>('chat_$id');
    if (cached != null && cached.isNotEmpty) {
      try {
        messages.assignAll(
          cached
              .map((e) => MessageModel.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
        );
      } catch (_) {
        // If deserialization fails, clear cache and fetch fresh
        box.erase();
      }
    }

    // Then load fresh messages from server
    loadMessages();
  }

  /// Load chat messages (API call)
  void loadMessages() async {
    final result = await _repository.fetchMessages(chatId);
    result.fold(
      (failure) =>
          Get.snackbar("Error", failure.message ?? "Failed to load messages"),
      (data) {
        messages.assignAll(data);
        _cacheMessages(); // save to local storage
        _scrollToBottom(); // scroll to latest
      },
    );
  }

  /// Send new message
  void sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    isSending.value = true;

    final result = await _repository.sendMessage(
      chatId: chatId,
      message: message.trim(),
    );
    result.fold(
      (failure) => Get.snackbar("Error", failure.message ?? "Send failed"),
      (data) {
        messages.assignAll(data);
        _cacheMessages();
        messageInput.value = '';
        _scrollToBottom();
      },
    );

    isSending.value = false;
  }

  /// Cache messages locally for offline persistence
  void _cacheMessages() {
    final jsonList = messages.map((msg) => msg.toJson()).toList();
    box.write('chat_$chatId', jsonList);
  }

  /// Auto-scroll to bottom
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    _cacheMessages();
    scrollController.dispose();
    super.onClose();
  }
}
