class MovieParentalGuidesResponse {
  MovieParentalGuidesResponse({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  MovieParentalGuidesResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }
}

class Meta {
  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  Meta.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = serverTime;
    map['server_timezone'] = serverTimezone;
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }
}

class Data {
  Data({
    this.parentalGuideCount,
    this.parentalGuides,
  });

  Data.fromJson(dynamic json) {
    parentalGuideCount = json['parental_guide_count'];
    if (json['parental_guides'] != null) {
      parentalGuides = [];
      json['parental_guides'].forEach((v) {
        parentalGuides?.add(ParentalGuides.fromJson(v));
      });
    }
  }

  int? parentalGuideCount;
  List<ParentalGuides>? parentalGuides;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parental_guide_count'] = parentalGuideCount;
    if (parentalGuides != null) {
      map['parental_guides'] =
          parentalGuides?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ParentalGuides {
  ParentalGuides({
    this.type,
    this.parentalGuideText,
  });

  ParentalGuides.fromJson(dynamic json) {
    type = json['type'];
    parentalGuideText = json['parental_guide_text'];
  }

  String? type;
  String? parentalGuideText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['parental_guide_text'] = parentalGuideText;
    return map;
  }
}
