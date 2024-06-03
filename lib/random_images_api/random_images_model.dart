// To parse this JSON data, do
//
//     final randomImage = randomImageFromJson(jsonString);

import 'dart:convert';


import 'package:flutter/material.dart';

import '../utils/utilities.dart';

RandomImageModel randomImageFromJson(String str) =>
    RandomImageModel.fromJson(json.decode(str));

String randomImageToJson(RandomImageModel data) => json.encode(data.toJson());

class RandomImageModel {
  List<Item>? items;
  int? count;

  RandomImageModel({
    this.items,
    this.count,
  });

  RandomImageModel copyWith({
    List<Item>? items,
    int? count,
  }) =>
      RandomImageModel(
        items: items ?? this.items,
        count: count ?? this.count,
      );

  factory RandomImageModel.fromJson(Map<String, dynamic> json) => RandomImageModel(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "count": count,
      };
}

class Item {
  int? id;
  String? idV2;
  String? imageUrl;
  String? sampleUrl;
  int? imageSize;
  int? imageWidth;
  int? imageHeight;
  int? sampleSize;
  int? sampleWidth;
  int? sampleHeight;
  String? source;
  dynamic sourceId;
  String? rating;
  String? verification;
  String? hashMd5;
  String? hashPerceptual;
  Color? colorDominant;
  List<Color>? colorPalette;
  dynamic duration;
  bool? isOriginal;
  bool? isScreenshot;
  bool? isFlagged;
  bool? isAnimated;
  dynamic artist;
  List<Character>? characters;
  List<Tag>? tags;
  double? createdAt;
  double? updatedAt;

  Item({
    this.id,
    this.idV2,
    this.imageUrl,
    this.sampleUrl,
    this.imageSize,
    this.imageWidth,
    this.imageHeight,
    this.sampleSize,
    this.sampleWidth,
    this.sampleHeight,
    this.source,
    this.sourceId,
    this.rating,
    this.verification,
    this.hashMd5,
    this.hashPerceptual,
    this.colorDominant,
    this.colorPalette,
    this.duration,
    this.isOriginal,
    this.isScreenshot,
    this.isFlagged,
    this.isAnimated,
    this.artist,
    this.characters,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  Item copyWith({
    int? id,
    String? idV2,
    String? imageUrl,
    String? sampleUrl,
    int? imageSize,
    int? imageWidth,
    int? imageHeight,
    int? sampleSize,
    int? sampleWidth,
    int? sampleHeight,
    String? source,
    dynamic sourceId,
    String? rating,
    String? verification,
    String? hashMd5,
    String? hashPerceptual,
    List<int>? colorDominant,
    List<List<int>>? colorPalette,
    dynamic duration,
    bool? isOriginal,
    bool? isScreenshot,
    bool? isFlagged,
    bool? isAnimated,
    dynamic artist,
    List<Character>? characters,
    List<Tag>? tags,
    double? createdAt,
    double? updatedAt,
  }) =>
      Item(
        id: id ?? this.id,
        idV2: idV2 ?? this.idV2,
        imageUrl: imageUrl ?? this.imageUrl,
        sampleUrl: sampleUrl ?? this.sampleUrl,
        imageSize: imageSize ?? this.imageSize,
        imageWidth: imageWidth ?? this.imageWidth,
        imageHeight: imageHeight ?? this.imageHeight,
        sampleSize: sampleSize ?? this.sampleSize,
        sampleWidth: sampleWidth ?? this.sampleWidth,
        sampleHeight: sampleHeight ?? this.sampleHeight,
        source: source ?? this.source,
        sourceId: sourceId ?? this.sourceId,
        rating: rating ?? this.rating,
        verification: verification ?? this.verification,
        hashMd5: hashMd5 ?? this.hashMd5,
        hashPerceptual: hashPerceptual ?? this.hashPerceptual,
        colorDominant: colorDominant != null ? Utilities.colorRgboExtracter(colorDominant) : this.colorDominant,
        colorPalette: colorPalette != null ? colorPalette.map((e) => Utilities.colorRgboExtracter(e)).toList(): this.colorPalette,
        duration: duration ?? this.duration,
        isOriginal: isOriginal ?? this.isOriginal,
        isScreenshot: isScreenshot ?? this.isScreenshot,
        isFlagged: isFlagged ?? this.isFlagged,
        isAnimated: isAnimated ?? this.isAnimated,
        artist: artist ?? this.artist,
        characters: characters ?? this.characters,
        tags: tags ?? this.tags,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        idV2: json["id_v2"],
        imageUrl: json["image_url"],
        sampleUrl: json["sample_url"],
        imageSize: json["image_size"],
        imageWidth: json["image_width"],
        imageHeight: json["image_height"],
        sampleSize: json["sample_size"],
        sampleWidth: json["sample_width"],
        sampleHeight: json["sample_height"],
        source: json["source"],
        sourceId: json["source_id"],
        rating: json["rating"],
        verification: json["verification"],
        hashMd5: json["hash_md5"],
        hashPerceptual: json["hash_perceptual"],
        colorDominant: json["color_dominant"] == null ? Colors.transparent : Utilities.colorRgboExtracter(json["color_dominant"] == null
            ? []
            : List<int>.from(json["color_dominant"]!.map((x) => x))),
        colorPalette: json["color_palette"] == null
            ? [Colors.transparent]
            : List<Color>.from(json["color_palette"]!
                .map((x) => Utilities.colorRgboExtracter(List<int>.from(x.map((x) => x))))),
        duration: json["duration"],
        isOriginal: json["is_original"],
        isScreenshot: json["is_screenshot"],
        isFlagged: json["is_flagged"],
        isAnimated: json["is_animated"],
        artist: json["artist"],
        characters: json["characters"] == null
            ? []
            : List<Character>.from(
                json["characters"]!.map((x) => Character.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        createdAt: json["created_at"]?.toDouble(),
        updatedAt: json["updated_at"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_v2": idV2,
        "image_url": imageUrl,
        "sample_url": sampleUrl,
        "image_size": imageSize,
        "image_width": imageWidth,
        "image_height": imageHeight,
        "sample_size": sampleSize,
        "sample_width": sampleWidth,
        "sample_height": sampleHeight,
        "source": source,
        "source_id": sourceId,
        "rating": rating,
        "verification": verification,
        "hash_md5": hashMd5,
        "hash_perceptual": hashPerceptual,
        "color_dominant": colorDominant == null
            ? [] : Utilities.colorRgboCompressor(colorDominant!),
            // : List<dynamic>.from(colorDominant!.map((x) => x)),
        "color_palette": colorPalette == null
            ? [] : colorPalette!.map((e) => Utilities.colorRgboCompressor(e)).toList(),
            // : List<dynamic>.from(
            //     colorPalette!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "duration": duration,
        "is_original": isOriginal,
        "is_screenshot": isScreenshot,
        "is_flagged": isFlagged,
        "is_animated": isAnimated,
        "artist": artist,
        "characters": characters == null
            ? []
            : List<dynamic>.from(characters!.map((x) => x.toJson())),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Character {
  int? id;
  String? idV2;
  String? name;
  List<String>? aliases;
  String? description;
  List<int>? ages;
  dynamic height;
  dynamic weight;
  String? gender;
  String? species;
  dynamic birthday;
  String? nationality;
  List<String>? occupations;

  Character({
    this.id,
    this.idV2,
    this.name,
    this.aliases,
    this.description,
    this.ages,
    this.height,
    this.weight,
    this.gender,
    this.species,
    this.birthday,
    this.nationality,
    this.occupations,
  });

  Character copyWith({
    int? id,
    String? idV2,
    String? name,
    List<String>? aliases,
    String? description,
    List<int>? ages,
    dynamic height,
    dynamic weight,
    String? gender,
    String? species,
    dynamic birthday,
    String? nationality,
    List<String>? occupations,
  }) =>
      Character(
        id: id ?? this.id,
        idV2: idV2 ?? this.idV2,
        name: name ?? this.name,
        aliases: aliases ?? this.aliases,
        description: description ?? this.description,
        ages: ages ?? this.ages,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        gender: gender ?? this.gender,
        species: species ?? this.species,
        birthday: birthday ?? this.birthday,
        nationality: nationality ?? this.nationality,
        occupations: occupations ?? this.occupations,
      );

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        idV2: json["id_v2"],
        name: json["name"],
        aliases: json["aliases"] == null
            ? []
            : List<String>.from(json["aliases"]!.map((x) => x)),
        description: json["description"],
        ages: json["ages"] == null
            ? []
            : List<int>.from(json["ages"]!.map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        gender: json["gender"],
        species: json["species"],
        birthday: json["birthday"],
        nationality: json["nationality"],
        occupations: json["occupations"] == null
            ? []
            : List<String>.from(json["occupations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_v2": idV2,
        "name": name,
        "aliases":
            aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
        "description": description,
        "ages": ages == null ? [] : List<dynamic>.from(ages!.map((x) => x)),
        "height": height,
        "weight": weight,
        "gender": gender,
        "species": species,
        "birthday": birthday,
        "nationality": nationality,
        "occupations": occupations == null
            ? []
            : List<dynamic>.from(occupations!.map((x) => x)),
      };
}

class Tag {
  int? id;
  String? idV2;
  String? name;
  String? description;
  Sub? sub;
  bool? isNsfw;

  Tag({
    this.id,
    this.idV2,
    this.name,
    this.description,
    this.sub,
    this.isNsfw,
  });

  Tag copyWith({
    int? id,
    String? idV2,
    String? name,
    String? description,
    Sub? sub,
    bool? isNsfw,
  }) =>
      Tag(
        id: id ?? this.id,
        idV2: idV2 ?? this.idV2,
        name: name ?? this.name,
        description: description ?? this.description,
        sub: sub ?? this.sub,
        isNsfw: isNsfw ?? this.isNsfw,
      );

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        idV2: json["id_v2"],
        name: json["name"],
        description: json["description"],
        sub: subValues.map[json["sub"]]!,
        isNsfw: json["is_nsfw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_v2": idV2,
        "name": name,
        "description": description,
        "sub": subValues.reverse[sub],
        "is_nsfw": isNsfw,
      };
}


enum Sub { character, setting }

final subValues =
    EnumValues({"character": Sub.character, "setting": Sub.setting});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
