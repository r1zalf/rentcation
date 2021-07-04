// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromJson(jsonString);

import 'dart:convert';

CityResponse cityResponseFromJson(String str) => CityResponse.fromJson(json.decode(str));

String cityResponseToJson(CityResponse data) => json.encode(data.toJson());

class CityResponse {
    CityResponse({
        this.from,
        this.to,
        this.total,
        this.auditData,
        this.destinations,
    });

    int from;
    int to;
    int total;
    AuditData auditData;
    List<Destination> destinations;

    factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        from: json["from"],
        to: json["to"],
        total: json["total"],
        auditData: AuditData.fromJson(json["auditData"]),
        destinations: List<Destination>.from(json["destinations"].map((x) => Destination.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "total": total,
        "auditData": auditData.toJson(),
        "destinations": List<dynamic>.from(destinations.map((x) => x.toJson())),
    };
}

class AuditData {
    AuditData({
        this.processTime,
        this.timestamp,
        this.requestHost,
        this.serverId,
        this.environment,
        this.release,
        this.internal,
    });

    String processTime;
    DateTime timestamp;
    String requestHost;
    String serverId;
    String environment;
    String release;
    String internal;

    factory AuditData.fromJson(Map<String, dynamic> json) => AuditData(
        processTime: json["processTime"],
        timestamp: DateTime.parse(json["timestamp"]),
        requestHost: json["requestHost"],
        serverId: json["serverId"],
        environment: json["environment"],
        release: json["release"],
        internal: json["internal"],
    );

    Map<String, dynamic> toJson() => {
        "processTime": processTime,
        "timestamp": timestamp.toIso8601String(),
        "requestHost": requestHost,
        "serverId": serverId,
        "environment": environment,
        "release": release,
        "internal": internal,
    };
}

class Destination {
    Destination({
        this.code,
        this.name,
        this.countryCode,
        this.isoCode,
        this.zones,
        this.groupZones,
    });

    String code;
    Name name;
    Code countryCode;
    Code isoCode;
    List<Zone> zones;
    List<GroupZone> groupZones;

    factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        code: json["code"],
        name: Name.fromJson(json["name"]),
        countryCode: codeValues.map[json["countryCode"]],
        isoCode: codeValues.map[json["isoCode"]],
        zones: List<Zone>.from(json["zones"].map((x) => Zone.fromJson(x))),
        groupZones: List<GroupZone>.from(json["groupZones"].map((x) => GroupZone.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name.toJson(),
        "countryCode": codeValues.reverse[countryCode],
        "isoCode": codeValues.reverse[isoCode],
        "zones": List<dynamic>.from(zones.map((x) => x.toJson())),
        "groupZones": List<dynamic>.from(groupZones.map((x) => x.toJson())),
    };
}

enum Code { ID }

final codeValues = EnumValues({
    "ID": Code.ID
});

class GroupZone {
    GroupZone({
        this.groupZoneCode,
        this.name,
        this.zones,
    });

    String groupZoneCode;
    Name name;
    List<int> zones;

    factory GroupZone.fromJson(Map<String, dynamic> json) => GroupZone(
        groupZoneCode: json["groupZoneCode"],
        name: Name.fromJson(json["name"]),
        zones: List<int>.from(json["zones"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "groupZoneCode": groupZoneCode,
        "name": name.toJson(),
        "zones": List<dynamic>.from(zones.map((x) => x)),
    };
}

class Name {
    Name({
        this.content,
    });

    String content;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
    };
}

class Zone {
    Zone({
        this.zoneCode,
        this.name,
        this.description,
    });

    int zoneCode;
    String name;
    Name description;

    factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        zoneCode: json["zoneCode"],
        name: json["name"],
        description: Name.fromJson(json["description"]),
    );

    Map<String, dynamic> toJson() => {
        "zoneCode": zoneCode,
        "name": name,
        "description": description.toJson(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
