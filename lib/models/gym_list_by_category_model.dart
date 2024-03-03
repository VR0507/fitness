import 'dart:convert';

class GymListByCategoryModel {
  final bool? status;
  final String? message;
  final List<Datum>? data;

  GymListByCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory GymListByCategoryModel.fromRawJson(String str) => GymListByCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GymListByCategoryModel.fromJson(Map<String, dynamic> json) => GymListByCategoryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? gymId;
  final String? gymName;
  final String? gymLogo;
  final List<String>? gymImages;
  final String? address;
  final String? description;
  final String? howToGet;
  final String? partnerName;
  final String? partnerEmail;
  final String? partnerPhone;
  final String? phoneCode;
  final String? avaliableSlots;
  final List<Amenity>? amenities;
  final List<String>? gymImages2;
  final String? open;
  final String? rating;
  final List<Category>? categories;
  final String? distance;
  final String? imgPath;

  Datum({
    this.gymId,
    this.gymName,
    this.gymLogo,
    this.gymImages,
    this.address,
    this.description,
    this.howToGet,
    this.partnerName,
    this.partnerEmail,
    this.partnerPhone,
    this.phoneCode,
    this.avaliableSlots,
    this.amenities,
    this.gymImages2,
    this.open,
    this.rating,
    this.categories,
    this.distance,
    this.imgPath,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    gymId: json["gym_id"],
    gymName: json["gym_name"],
    gymLogo: json["gym_logo"],
    gymImages: json["gym_images"] == null ? [] : List<String>.from(json["gym_images"]!.map((x) => x)),
    address: json["address"],
    description: json["description"],
    howToGet: json["how_to_get"],
    partnerName: json["partner_name"],
    partnerEmail: json["partner_email"],
    partnerPhone: json["partner_phone"],
    phoneCode: json["phone_code"],
    avaliableSlots: json["avaliable_slots"],
    amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
    gymImages2: json["gym_images2"] == null ? [] : List<String>.from(json["gym_images2"]!.map((x) => x)),
    open: json["open"],
    rating: json["rating"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    distance: json["distance"],
    imgPath: json["img_path"],
  );

  Map<String, dynamic> toJson() => {
    "gym_id": gymId,
    "gym_name": gymName,
    "gym_logo": gymLogo,
    "gym_images": gymImages == null ? [] : List<dynamic>.from(gymImages!.map((x) => x)),
    "address": address,
    "description": description,
    "how_to_get": howToGet,
    "partner_name": partnerName,
    "partner_email": partnerEmail,
    "partner_phone": partnerPhone,
    "phone_code": phoneCode,
    "avaliable_slots": avaliableSlots,
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
    "gym_images2": gymImages2 == null ? [] : List<dynamic>.from(gymImages2!.map((x) => x)),
    "open": open,
    "rating": rating,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "distance": distance,
    "img_path": imgPath,
  };
}

class Amenity {
  final int? id;
  final String? name;
  final String? icon;

  Amenity({
    this.id,
    this.name,
    this.icon,
  });

  factory Amenity.fromRawJson(String str) => Amenity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
  };
}

class Category {
  final int? pricingId;
  final String? categoryName;
  final int? categoryId;
  final List<Price>? price;

  Category({
    this.pricingId,
    this.categoryName,
    this.categoryId,
    this.price,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    pricingId: json["pricing_id"],
    categoryName: json["category_name"],
    categoryId: json["category_id"],
    price: json["price"] == null ? [] : List<Price>.from(json["price"]!.map((x) => Price.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pricing_id": pricingId,
    "category_name": categoryName,
    "category_id": categoryId,
    "price": price == null ? [] : List<dynamic>.from(price!.map((x) => x.toJson())),
  };
}

class Price {
  final int? hour;
  final int? rate;

  Price({
    this.hour,
    this.rate,
  });

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    hour: json["hour"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "hour": hour,
    "rate": rate,
  };
}
