class NotificationSettingModel {
  final String title;
  final String subtitle;
  bool isEnabled;

  NotificationSettingModel({
    required this.title,
    required this.subtitle,
    this.isEnabled = false,
  });
}
