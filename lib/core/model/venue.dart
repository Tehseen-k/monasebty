import 'dart:convert';

class Venue {
  final int id;
  final String name;
  final String location; // Combined location (city, state, zipCode)
  final String address;
  final String price; // General price for booking
  final int capacity;
  final String workingHours; // Working hours of the venue
  final String availableDates; // Comma-separated list of available dates
  final String? image; // Venue image (URI)
  final String? imageUrl; // Image URL
  final String? description;
  final String? owner;
  final bool isAvailable;
  final String? discount; // Discount percentage
  final String? createdAt;
  final String? updatedAt;

  Venue({
    required this.id,
    required this.name,
    required this.location,
    required this.address,
    required this.price,
    required this.capacity,
    required this.workingHours,
    required this.availableDates,
    this.image,
    this.imageUrl,
    this.description,
    this.owner,
    required this.isAvailable,
    this.discount,
    this.createdAt,
    this.updatedAt,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      address: json['address'] as String? ?? '',
      price: json['price'] as String? ?? '',
      capacity: json['capacity'] as int? ?? 0,
      workingHours: json['working_hours'] as String? ?? '',
      availableDates: json['available_dates'] as String? ?? '',
      image: json['image'] as String?,
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
      owner: json['owner'] as String?,
      isAvailable: json['is_available'] as bool? ?? false,
      discount: json['discount'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'address': address,
      'price': price,
      'capacity': capacity,
      'working_hours': workingHours,
      'available_dates': availableDates,
      'image': image,
      'image_url': imageUrl,
      'description': description,
      'owner': owner,
      'is_available': isAvailable,
      'discount': discount,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
