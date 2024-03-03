import 'dart:convert';

class GymListModel {
  final bool? status;
  final String? message;
  final String? messageIos;
  final List<CityList>? cityList;
  final List<Datum>? data;

  GymListModel({
    this.status,
    this.message,
    this.messageIos,
    this.cityList,
    this.data,
  });

  factory GymListModel.fromRawJson(String str) => GymListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GymListModel.fromJson(Map<String, dynamic> json) => GymListModel(
    status: json["status"],
    message: json["message"],
    messageIos: json["message_ios"],
    cityList: json["city_list"] == null ? [] : List<CityList>.from(json["city_list"]!.map((x) => CityList.fromJson(x))),
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ios": messageIos,
    "city_list": cityList == null ? [] : List<dynamic>.from(cityList!.map((x) => x.toJson())),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CityList {
  final int? id;
  final String? cityName;
  final double? geoLatitude;
  final double? geoLongitude;

  CityList({
    this.id,
    this.cityName,
    this.geoLatitude,
    this.geoLongitude,
  });

  factory CityList.fromRawJson(String str) => CityList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
    id: json["id"],
    cityName: json["city_name"],
    geoLatitude: json["geo_latitude"]?.toDouble(),
    geoLongitude: json["geo_longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_name": cityName,
    "geo_latitude": geoLatitude,
    "geo_longitude": geoLongitude,
  };
}

class Datum {
  final int? gymId;
  final String? gymName;
  final String? gymLogo;
  final List<String>? gymImages;
  final String? address;
  final String? cityName;
  final String? description;
  final String? howToGet;
  final String? partnerName;
  final String? partnerEmail;
  final String? partnerPhone;
  final String? phoneCode;
  final String? latitude;
  final String? longitude;
  final List<Amenity>? amenities;
  final List<String>? gymImages2;
  final String? open;
  final String? rating;
  final List<Category>? categories;
  final String? distance;
  final String? imgPath;
  final String? avaliableSlots;

  Datum({
    this.gymId,
    this.gymName,
    this.gymLogo,
    this.gymImages,
    this.address,
    this.cityName,
    this.description,
    this.howToGet,
    this.partnerName,
    this.partnerEmail,
    this.partnerPhone,
    this.phoneCode,
    this.latitude,
    this.longitude,
    this.amenities,
    this.gymImages2,
    this.open,
    this.rating,
    this.categories,
    this.distance,
    this.imgPath,
    this.avaliableSlots,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    gymId: json["gym_id"],
    gymName: json["gym_name"],
    gymLogo: json["gym_logo"],
    gymImages: json["gym_images"] == null ? [] : List<String>.from(json["gym_images"]!.map((x) => x)),
    address: json["address"],
    cityName: json["city_name"],
    description: json["description"],
    howToGet: json["how_to_get"],
    partnerName: json["partner_name"],
    partnerEmail: json["partner_email"],
    partnerPhone: json["partner_phone"],
    phoneCode: json["phone_code"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
    gymImages2: json["gym_images2"] == null ? [] : List<String>.from(json["gym_images2"]!.map((x) => x)),
    open: json["open"],
    rating: json["rating"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    distance: json["distance"],
    imgPath: json["img_path"],
    avaliableSlots: json["avaliable_slots"],
  );

  Map<String, dynamic> toJson() => {
    "gym_id": gymId,
    "gym_name": gymName,
    "gym_logo": gymLogo,
    "gym_images": gymImages == null ? [] : List<dynamic>.from(gymImages!.map((x) => x)),
    "address": address,
    "city_name": cityName,
    "description": description,
    "how_to_get": howToGet,
    "partner_name": partnerName,
    "partner_email": partnerEmail,
    "partner_phone": partnerPhone,
    "phone_code": phoneCode,
    "latitude": latitude,
    "longitude": longitude,
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
    "gym_images2": gymImages2 == null ? [] : List<dynamic>.from(gymImages2!.map((x) => x)),
    "open": open,
    "rating": rating,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "distance": distance,
    "img_path": imgPath,
    "avaliable_slots": avaliableSlots,
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
