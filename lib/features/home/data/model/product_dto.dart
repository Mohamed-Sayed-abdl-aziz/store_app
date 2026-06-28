import 'package:ecommerce/features/home/domain/entity/product_entity.dart';

class ProductDto {
  final List<ProductsDto>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductDto({this.products, this.total, this.skip, this.limit});

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      products: json['products'] != null
          ? (json['products'] as List)
                .map((v) => ProductsDto.fromJson(v))
                .toList()
          : null,
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class ProductsDto {
  ProductsDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final DimensionsDto? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ReviewsDto>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final MetaDto? meta;
  final List<String>? images;
  final String? thumbnail;

  factory ProductsDto.fromJson(Map<String, dynamic> json) {
    return ProductsDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      // الـ num.tryParse بيحمي الكود لو السيرفر بعت الرقم int وهو متوقع double أو العكس
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      discountPercentage: json['discountPercentage'] != null
          ? (json['discountPercentage'] as num).toDouble()
          : null,
      rating: json['rating'] != null
          ? (json['rating'] as num).toDouble()
          : null,
      stock: json['stock'] as int?,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      brand: json['brand'] as String?,
      sku: json['sku'] as String?,
      weight: json['weight'] as int?,
      dimensions: json['dimensions'] != null
          ? DimensionsDto.fromJson(json['dimensions'])
          : null,
      warrantyInformation: json['warrantyInformation'] as String?,
      shippingInformation: json['shippingInformation'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
                .map((v) => ReviewsDto.fromJson(v))
                .toList()
          : null,
      returnPolicy: json['returnPolicy'] as String?,
      minimumOrderQuantity: json['minimumOrderQuantity'] as int?,
      meta: json['meta'] != null ? MetaDto.fromJson(json['meta']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      thumbnail: json['thumbnail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;
    if (dimensions != null) data['dimensions'] = dimensions!.toJson();
    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) data['meta'] = meta!.toJson();
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }

  ProductEntity toEntity() {
    return ProductEntity(
      title: title ?? " ",
      image: images?[0] ?? " ",
      price: price ?? 0,
      id: id ?? -1,
      description: description ?? "",
      category: category ?? "",
    );
  }
}

class DimensionsDto {
  final double? width;
  final double? height;
  final double? depth;

  DimensionsDto({this.width, this.height, this.depth});

  factory DimensionsDto.fromJson(Map<String, dynamic> json) {
    return DimensionsDto(
      width: json['width'] != null ? (json['width'] as num).toDouble() : null,
      height: json['height'] != null
          ? (json['height'] as num).toDouble()
          : null,
      depth: json['depth'] != null ? (json['depth'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }
}

class ReviewsDto {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ReviewsDto({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewsDto.fromJson(Map<String, dynamic> json) {
    return ReviewsDto(
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
      date: json['date'] as String?,
      reviewerName: json['reviewerName'] as String?,
      reviewerEmail: json['reviewerEmail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    data['reviewerEmail'] = reviewerEmail;
    return data;
  }
}

class MetaDto {
  final String? createdAt;
  final String? updatedAt;
  final String? barcode;
  final String? qrCode;

  MetaDto({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaDto.fromJson(Map<String, dynamic> json) {
    return MetaDto(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      barcode: json['barcode'] as String?,
      qrCode: json['qrCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }
}
