import 'package:flutter/material.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';

class LocalSearchCategoryModel {
  String name;
  String backgroundColor;
  String imageUrl;

  LocalSearchCategoryModel({
    required this.name,
    required this.backgroundColor,
    required this.imageUrl,
  });

  factory LocalSearchCategoryModel.fromJson(Map<String, dynamic> json) =>
      LocalSearchCategoryModel(
        name: json["name"],
        backgroundColor: json["backgroundColor"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "backgroundColor": backgroundColor,
        "imageUrl": imageUrl,
      };

  SearchCategory toSearchCategoryEntity() => SearchCategory(
        name: name,
        backgroundColor: Color(
            int.parse(backgroundColor.substring(1, 7), radix: 16) + 0xFF000000),
        imageUrl: imageUrl,
      );
}
