import '../../domain/entities/load.dart';

class LoadModel extends LoadEntity {
  LoadModel({
    required String id,
    required String title,
    required String description,
    required String category,
    required String pickupLocation,
    required String deliveryLocation,
    required String companyToken,
    required String loadBy,
    required String orderStatus,
    DateTime? pickupDate,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
         id: id,
         title: title,
         description: description,
         category: category,
         pickupLocation: pickupLocation,
         deliveryLocation: deliveryLocation,
         companyToken: companyToken,
         loadBy: loadBy,
         orderStatus: orderStatus,
         pickupDate: pickupDate,
         note: note,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory LoadModel.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? s) => s == null ? null : DateTime.tryParse(s);

    return LoadModel(
      id: json['_id'] as String? ?? json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      pickupLocation: json['pickupLocation'] as String? ?? '',
      deliveryLocation: json['deliveryLocation'] as String? ?? '',
      companyToken: json['companyToken'] as String? ?? '',
      loadBy: json['loadBy'] as String? ?? '',
      orderStatus: json['orderStatus'] as String? ?? '',
      pickupDate: parseDate(json['pickupDate'] as String?),
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'category': category,
      'pickupLocation': pickupLocation,
      'deliveryLocation': deliveryLocation,
      'companyToken': companyToken,
      'loadBy': loadBy,
      'orderStatus': orderStatus,
      'pickupDate': pickupDate?.toIso8601String(),
      'note': note,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
