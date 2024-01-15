// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  List<Datum>? data;
  Meta? meta;

  Restaurant({
    this.data,
    this.meta,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datum {
  int? id;
  DatumAttributes? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attributes: json["attributes"] == null ? null : DatumAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class DatumAttributes {
  String? name;
  String? category;
  int? discount;
  double? deliveryFee;
  int? deliveryTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  Picture? picture;

  DatumAttributes({
    this.name,
    this.category,
    this.discount,
    this.deliveryFee,
    this.deliveryTime,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.picture,
  });

  factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
    name: json["name"],
    category: json["category"],
    discount: json["discount"],
    deliveryFee: json["deliveryFee"]?.toDouble(),
    deliveryTime: json["deliveryTime"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "category": category,
    "discount": discount,
    "deliveryFee": deliveryFee,
    "deliveryTime": deliveryTime,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "publishedAt": publishedAt?.toIso8601String(),
    "picture": picture?.toJson(),
  };
}

class Picture {
  Data? data;

  Picture({
    this.data,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  DataAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    attributes: json["attributes"] == null ? null : DataAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class DataAttributes {
  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  Ext? ext;
  Mime? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  Provider? provider;
  dynamic providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
    name: json["name"],
    alternativeText: json["alternativeText"],
    caption: json["caption"],
    width: json["width"],
    height: json["height"],
    formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
    hash: json["hash"],
    ext: extValues.map[json["ext"]]!,
    mime: mimeValues.map[json["mime"]]!,
    size: json["size"]?.toDouble(),
    url: json["url"],
    previewUrl: json["previewUrl"],
    provider: providerValues.map[json["provider"]]!,
    providerMetadata: json["provider_metadata"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "alternativeText": alternativeText,
    "caption": caption,
    "width": width,
    "height": height,
    "formats": formats?.toJson(),
    "hash": hash,
    "ext": extValues.reverse[ext],
    "mime": mimeValues.reverse[mime],
    "size": size,
    "url": url,
    "previewUrl": previewUrl,
    "provider": providerValues.reverse[provider],
    "provider_metadata": providerMetadata,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

enum Ext {
  JPG
}

final extValues = EnumValues({
  ".jpg": Ext.JPG
});

class Formats {
  Large? large;
  Large? small;
  Large? medium;
  Large? thumbnail;

  Formats({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    large: json["large"] == null ? null : Large.fromJson(json["large"]),
    small: json["small"] == null ? null : Large.fromJson(json["small"]),
    medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
    thumbnail: json["thumbnail"] == null ? null : Large.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "large": large?.toJson(),
    "small": small?.toJson(),
    "medium": medium?.toJson(),
    "thumbnail": thumbnail?.toJson(),
  };
}

class Large {
  Ext? ext;
  String? url;
  String? hash;
  Mime? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;

  Large({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
  });

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    ext: extValues.map[json["ext"]]!,
    url: json["url"],
    hash: json["hash"],
    mime: mimeValues.map[json["mime"]]!,
    name: json["name"],
    path: json["path"],
    size: json["size"]?.toDouble(),
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "ext": extValues.reverse[ext],
    "url": url,
    "hash": hash,
    "mime": mimeValues.reverse[mime],
    "name": name,
    "path": path,
    "size": size,
    "width": width,
    "height": height,
  };
}

enum Mime {
  APPLICATION_OCTET_STREAM,
  IMAGE_JPEG
}

final mimeValues = EnumValues({
  "application/octet-stream": Mime.APPLICATION_OCTET_STREAM,
  "image/jpeg": Mime.IMAGE_JPEG
});

enum Provider {
  LOCAL
}

final providerValues = EnumValues({
  "local": Provider.LOCAL
});

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"],
    pageSize: json["pageSize"],
    pageCount: json["pageCount"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "pageSize": pageSize,
    "pageCount": pageCount,
    "total": total,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
