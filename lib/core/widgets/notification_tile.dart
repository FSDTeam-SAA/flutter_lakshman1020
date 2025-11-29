import 'package:flutter/material.dart';

import '../../features/home/models/app_text_styles.dart';
import '../../features/notification/data/models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: notification.isRead ? Colors.grey.shade200 : Colors.blue.shade200,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: _getTypeColor(notification.type),
          child: Text(
            notification.typeIcon,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                notification.title,
                style: TTextStyles.label.copyWith(
                  fontWeight: notification.isRead ? FontWeight.normal : FontWeight.w600,
                ),
              ),
            ),
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.message,
              style: TTextStyles.hint,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getTypeColor(notification.type).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    notification.type,
                    style: TTextStyles.hint.copyWith(
                      fontSize: 10,
                      color: _getTypeColor(notification.type),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  notification.formattedTime,
                  style: TTextStyles.hint.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'user':
        return Colors.green;
      case 'dispatcher':
        return Colors.orange;
      case 'company':
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}
