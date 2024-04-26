// To parse this JSON data, do
//
//     final countyModel = countyModelFromJson(jsonString);

import 'dart:convert';

List<CountyModel> countyModelFromJson(String str) => List<CountyModel>.from(json.decode(str).map((x) => CountyModel.fromJson(x)));

String countyModelToJson(List<CountyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountyModel {
  Flags? flags;
  Name? name;
  bool? selected;

  CountyModel({
    this.flags,
    this.name,
    this.selected,
  });

  factory CountyModel.fromJson(Map<String, dynamic> json) => CountyModel(
    flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    selected: json["selected"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "flags": flags?.toJson(),
    "name": name?.toJson(),
  };
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json["png"],
    svg: json["svg"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
    "alt": alt,
  };
}

class Name {
  String? common;
  String? official;
  Map<String, NativeName>? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: Map.from(json["nativeName"]!).map((k, v) => MapEntry<String, NativeName>(k, NativeName.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": Map.from(nativeName!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class NativeName {
  String? official;
  String? common;

  NativeName({
    this.official,
    this.common,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
    official: json["official"],
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };
}
