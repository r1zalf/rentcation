// To parse this JSON data, do
//
//     final hotelResponse = hotelResponseFromJson(jsonString);

import 'dart:convert';

HotelResponse hotelResponseFromJson(String str) => HotelResponse.fromJson(json.decode(str));

String hotelResponseToJson(HotelResponse data) => json.encode(data.toJson());

class HotelResponse {
    HotelResponse({
        this.from,
        this.to,
        this.total,
        this.auditData,
        this.hotels,
    });

    int from;
    int to;
    int total;
    AuditData auditData;
    List<Hotel> hotels;

    factory HotelResponse.fromJson(Map<String, dynamic> json) => HotelResponse(
        from: json["from"],
        to: json["to"],
        total: json["total"],
        auditData: AuditData.fromJson(json["auditData"]),
        hotels: List<Hotel>.from(json["hotels"].map((x) => Hotel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "total": total,
        "auditData": auditData.toJson(),
        "hotels": List<dynamic>.from(hotels.map((x) => x.toJson())),
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

class Hotel {
    Hotel({
        this.code,
        this.name,
        this.description,
        this.countryCode,
        this.stateCode,
        this.destinationCode,
        this.zoneCode,
        this.coordinates,
        this.categoryCode,
        this.categoryGroupCode,
        this.chainCode,
        this.accommodationTypeCode,
        this.segmentCodes,
        this.address,
        this.postalCode,
        this.city,
        this.email,
        this.license,
        this.phones,
        this.rooms,
        this.facilities,
        this.issues,
        this.images,
        this.wildcards,
        this.web,
        this.lastUpdate,
        this.ranking,
        this.terminals,
        this.s2C,
    });

    int code;
    City name;
    City description;
    Code countryCode;
    Code stateCode;
    DestinationCode destinationCode;
    int zoneCode;
    Coordinates coordinates;
    CategoryCode categoryCode;
    CategoryGroupCode categoryGroupCode;
    String chainCode;
    AccommodationTypeCode accommodationTypeCode;
    List<int> segmentCodes;
    Address address;
    String postalCode;
    City city;
    String email;
    String license;
    List<Phone> phones;
    List<Room> rooms;
    List<Facility> facilities;
    List<Issue> issues;
    List<Image> images;
    List<Wildcard> wildcards;
    String web;
    DateTime lastUpdate;
    int ranking;
    List<Terminal> terminals;
    String s2C;

    factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        code: json["code"],
        name: City.fromJson(json["name"]),
        description: City.fromJson(json["description"]),
        countryCode: codeValues.map[json["countryCode"]],
        stateCode: codeValues.map[json["stateCode"]],
        destinationCode: destinationCodeValues.map[json["destinationCode"]],
        zoneCode: json["zoneCode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        categoryCode: categoryCodeValues.map[json["categoryCode"]],
        categoryGroupCode: categoryGroupCodeValues.map[json["categoryGroupCode"]],
        chainCode: json["chainCode"] == null ? null : json["chainCode"],
        accommodationTypeCode: accommodationTypeCodeValues.map[json["accommodationTypeCode"]],
        segmentCodes: json["segmentCodes"] == null ? null : List<int>.from(json["segmentCodes"].map((x) => x)),
        address: Address.fromJson(json["address"]),
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        city: City.fromJson(json["city"]),
        email: json["email"] == null ? null : json["email"],
        license: json["license"] == null ? null : json["license"],
        phones: List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        facilities: List<Facility>.from(json["facilities"].map((x) => Facility.fromJson(x))),
        issues: List<Issue>.from(json["issues"].map((x) => Issue.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        wildcards: json["wildcards"] == null ? null : List<Wildcard>.from(json["wildcards"].map((x) => Wildcard.fromJson(x))),
        web: json["web"] == null ? null : json["web"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        ranking: json["ranking"],
        terminals: json["terminals"] == null ? null : List<Terminal>.from(json["terminals"].map((x) => Terminal.fromJson(x))),
        s2C: json["S2C"] == null ? null : json["S2C"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name.toJson(),
        "description": description.toJson(),
        "countryCode": codeValues.reverse[countryCode],
        "stateCode": codeValues.reverse[stateCode],
        "destinationCode": destinationCodeValues.reverse[destinationCode],
        "zoneCode": zoneCode,
        "coordinates": coordinates.toJson(),
        "categoryCode": categoryCodeValues.reverse[categoryCode],
        "categoryGroupCode": categoryGroupCodeValues.reverse[categoryGroupCode],
        "chainCode": chainCode == null ? null : chainCode,
        "accommodationTypeCode": accommodationTypeCodeValues.reverse[accommodationTypeCode],
        "segmentCodes": segmentCodes == null ? null : List<dynamic>.from(segmentCodes.map((x) => x)),
        "address": address.toJson(),
        "postalCode": postalCode == null ? null : postalCode,
        "city": city.toJson(),
        "email": email == null ? null : email,
        "license": license == null ? null : license,
        "phones": List<dynamic>.from(phones.map((x) => x.toJson())),
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "issues": List<dynamic>.from(issues.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "wildcards": wildcards == null ? null : List<dynamic>.from(wildcards.map((x) => x.toJson())),
        "web": web == null ? null : web,
        "lastUpdate": "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
        "ranking": ranking,
        "terminals": terminals == null ? null : List<dynamic>.from(terminals.map((x) => x.toJson())),
        "S2C": s2C == null ? null : s2C,
    };
}

enum AccommodationTypeCode { HOTEL }

final accommodationTypeCodeValues = EnumValues({
    "HOTEL": AccommodationTypeCode.HOTEL
});

class Address {
    Address({
        this.content,
        this.street,
        this.number,
        this.floor,
    });

    String content;
    String street;
    String number;
    String floor;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        content: json["content"],
        street: json["street"],
        number: json["number"] == null ? null : json["number"],
        floor: json["floor"] == null ? null : json["floor"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "street": street,
        "number": number == null ? null : number,
        "floor": floor == null ? null : floor,
    };
}

enum CategoryCode { THE_5_EST, THE_3_EST, THE_4_EST, THE_2_EST }

final categoryCodeValues = EnumValues({
    "2EST": CategoryCode.THE_2_EST,
    "3EST": CategoryCode.THE_3_EST,
    "4EST": CategoryCode.THE_4_EST,
    "5EST": CategoryCode.THE_5_EST
});

enum CategoryGroupCode { GRUPO5, GRUPO3, GRUPO4, GRUPO2 }

final categoryGroupCodeValues = EnumValues({
    "GRUPO2": CategoryGroupCode.GRUPO2,
    "GRUPO3": CategoryGroupCode.GRUPO3,
    "GRUPO4": CategoryGroupCode.GRUPO4,
    "GRUPO5": CategoryGroupCode.GRUPO5
});

class City {
    City({
        this.content,
    });

    String content;

    factory City.fromJson(Map<String, dynamic> json) => City(
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
    };
}

class Coordinates {
    Coordinates({
        this.longitude,
        this.latitude,
    });

    double longitude;
    double latitude;

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
    };
}

enum Code { ID, THE_07 }

final codeValues = EnumValues({
    "ID": Code.ID,
    "07": Code.THE_07
});

enum DestinationCode { BDO }

final destinationCodeValues = EnumValues({
    "BDO": DestinationCode.BDO
});

class Facility {
    Facility({
        this.facilityCode,
        this.facilityGroupCode,
        this.order,
        this.number,
        this.voucher,
        this.indYesOrNo,
        this.indLogic,
        this.indFee,
        this.distance,
        this.timeFrom,
        this.timeTo,
        this.dateTo,
        this.ageFrom,
        this.ageTo,
        this.amount,
        this.currency,
        this.applicationType,
    });

    int facilityCode;
    int facilityGroupCode;
    int order;
    int number;
    bool voucher;
    bool indYesOrNo;
    bool indLogic;
    bool indFee;
    int distance;
    String timeFrom;
    String timeTo;
    DateTime dateTo;
    int ageFrom;
    int ageTo;
    int amount;
    String currency;
    String applicationType;

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        facilityCode: json["facilityCode"],
        facilityGroupCode: json["facilityGroupCode"],
        order: json["order"],
        number: json["number"] == null ? null : json["number"],
        voucher: json["voucher"],
        indYesOrNo: json["indYesOrNo"] == null ? null : json["indYesOrNo"],
        indLogic: json["indLogic"] == null ? null : json["indLogic"],
        indFee: json["indFee"] == null ? null : json["indFee"],
        distance: json["distance"] == null ? null : json["distance"],
        timeFrom: json["timeFrom"] == null ? null : json["timeFrom"],
        timeTo: json["timeTo"] == null ? null : json["timeTo"],
        dateTo: json["dateTo"] == null ? null : DateTime.parse(json["dateTo"]),
        ageFrom: json["ageFrom"] == null ? null : json["ageFrom"],
        ageTo: json["ageTo"] == null ? null : json["ageTo"],
        amount: json["amount"] == null ? null : json["amount"],
        currency: json["currency"] == null ? null : json["currency"],
        applicationType: json["applicationType"] == null ? null : json["applicationType"],
    );

    Map<String, dynamic> toJson() => {
        "facilityCode": facilityCode,
        "facilityGroupCode": facilityGroupCode,
        "order": order,
        "number": number == null ? null : number,
        "voucher": voucher,
        "indYesOrNo": indYesOrNo == null ? null : indYesOrNo,
        "indLogic": indLogic == null ? null : indLogic,
        "indFee": indFee == null ? null : indFee,
        "distance": distance == null ? null : distance,
        "timeFrom": timeFrom == null ? null : timeFrom,
        "timeTo": timeTo == null ? null : timeTo,
        "dateTo": dateTo == null ? null : "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
        "ageFrom": ageFrom == null ? null : ageFrom,
        "ageTo": ageTo == null ? null : ageTo,
        "amount": amount == null ? null : amount,
        "currency": currency == null ? null : currency,
        "applicationType": applicationType == null ? null : applicationType,
    };
}

class Image {
    Image({
        this.imageTypeCode,
        this.path,
        this.roomCode,
        this.roomType,
        this.characteristicCode,
        this.order,
        this.visualOrder,
    });

    ImageTypeCode imageTypeCode;
    String path;
    String roomCode;
    RoomTypeEnum roomType;
    String characteristicCode;
    int order;
    int visualOrder;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageTypeCode: imageTypeCodeValues.map[json["imageTypeCode"]],
        path: json["path"],
        roomCode: json["roomCode"] == null ? null : json["roomCode"],
        roomType: json["roomType"] == null ? null : roomTypeEnumValues.map[json["roomType"]],
        characteristicCode: json["characteristicCode"] == null ? null : json["characteristicCode"],
        order: json["order"],
        visualOrder: json["visualOrder"],
    );

    Map<String, dynamic> toJson() => {
        "imageTypeCode": imageTypeCodeValues.reverse[imageTypeCode],
        "path": path,
        "roomCode": roomCode == null ? null : roomCode,
        "roomType": roomType == null ? null : roomTypeEnumValues.reverse[roomType],
        "characteristicCode": characteristicCode == null ? null : characteristicCode,
        "order": order,
        "visualOrder": visualOrder,
    };
}

enum ImageTypeCode { HAB, RES, GEN, COM, CON, PIS, BAR, DEP, TER, PLA }

final imageTypeCodeValues = EnumValues({
    "BAR": ImageTypeCode.BAR,
    "COM": ImageTypeCode.COM,
    "CON": ImageTypeCode.CON,
    "DEP": ImageTypeCode.DEP,
    "GEN": ImageTypeCode.GEN,
    "HAB": ImageTypeCode.HAB,
    "PIS": ImageTypeCode.PIS,
    "PLA": ImageTypeCode.PLA,
    "RES": ImageTypeCode.RES,
    "TER": ImageTypeCode.TER
});

enum RoomTypeEnum { FAM, DBL, SUI, DBT, TWN, JSU, QUA, TPL, APT, STU, ROO, BUN, SGL, VIL, CTG, TLN, LOD }

final roomTypeEnumValues = EnumValues({
    "APT": RoomTypeEnum.APT,
    "BUN": RoomTypeEnum.BUN,
    "CTG": RoomTypeEnum.CTG,
    "DBL": RoomTypeEnum.DBL,
    "DBT": RoomTypeEnum.DBT,
    "FAM": RoomTypeEnum.FAM,
    "JSU": RoomTypeEnum.JSU,
    "LOD": RoomTypeEnum.LOD,
    "QUA": RoomTypeEnum.QUA,
    "ROO": RoomTypeEnum.ROO,
    "SGL": RoomTypeEnum.SGL,
    "STU": RoomTypeEnum.STU,
    "SUI": RoomTypeEnum.SUI,
    "TLN": RoomTypeEnum.TLN,
    "TPL": RoomTypeEnum.TPL,
    "TWN": RoomTypeEnum.TWN,
    "VIL": RoomTypeEnum.VIL
});

class Issue {
    Issue({
        this.issueCode,
        this.issueType,
        this.dateFrom,
        this.dateTo,
        this.order,
        this.alternative,
    });

    IssueCodeEnum issueCode;
    IssueCodeEnum issueType;
    DateTime dateFrom;
    DateTime dateTo;
    int order;
    bool alternative;

    factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        issueCode: issueCodeEnumValues.map[json["issueCode"]],
        issueType: issueCodeEnumValues.map[json["issueType"]],
        dateFrom: DateTime.parse(json["dateFrom"]),
        dateTo: DateTime.parse(json["dateTo"]),
        order: json["order"],
        alternative: json["alternative"],
    );

    Map<String, dynamic> toJson() => {
        "issueCode": issueCodeEnumValues.reverse[issueCode],
        "issueType": issueCodeEnumValues.reverse[issueType],
        "dateFrom": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
        "dateTo": "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
        "order": order,
        "alternative": alternative,
    };
}

enum IssueCodeEnum { COVID }

final issueCodeEnumValues = EnumValues({
    "COVID": IssueCodeEnum.COVID
});

class Phone {
    Phone({
        this.phoneNumber,
        this.phoneType,
    });

    String phoneNumber;
    PhoneType phoneType;

    factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        phoneNumber: json["phoneNumber"],
        phoneType: phoneTypeValues.map[json["phoneType"]],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "phoneType": phoneTypeValues.reverse[phoneType],
    };
}

enum PhoneType { PHONEBOOKING, PHONEHOTEL, PHONEMANAGEMENT, FAXNUMBER }

final phoneTypeValues = EnumValues({
    "FAXNUMBER": PhoneType.FAXNUMBER,
    "PHONEBOOKING": PhoneType.PHONEBOOKING,
    "PHONEHOTEL": PhoneType.PHONEHOTEL,
    "PHONEMANAGEMENT": PhoneType.PHONEMANAGEMENT
});

class Room {
    Room({
        this.roomCode,
        this.minPax,
        this.maxPax,
        this.maxAdults,
        this.maxChildren,
        this.minAdults,
        this.roomType,
        this.characteristicCode,
        this.roomFacilities,
        this.roomStays,
        this.pmsRoomCode,
    });

    String roomCode;
    int minPax;
    int maxPax;
    int maxAdults;
    int maxChildren;
    int minAdults;
    RoomTypeEnum roomType;
    String characteristicCode;
    List<RoomFacility> roomFacilities;
    List<RoomStay> roomStays;
    String pmsRoomCode;

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomCode: json["roomCode"],
        minPax: json["minPax"],
        maxPax: json["maxPax"],
        maxAdults: json["maxAdults"],
        maxChildren: json["maxChildren"],
        minAdults: json["minAdults"],
        roomType: roomTypeEnumValues.map[json["roomType"]],
        characteristicCode: json["characteristicCode"],
        roomFacilities: json["roomFacilities"] == null ? null : List<RoomFacility>.from(json["roomFacilities"].map((x) => RoomFacility.fromJson(x))),
        roomStays: json["roomStays"] == null ? null : List<RoomStay>.from(json["roomStays"].map((x) => RoomStay.fromJson(x))),
        pmsRoomCode: json["PMSRoomCode"] == null ? null : json["PMSRoomCode"],
    );

    Map<String, dynamic> toJson() => {
        "roomCode": roomCode,
        "minPax": minPax,
        "maxPax": maxPax,
        "maxAdults": maxAdults,
        "maxChildren": maxChildren,
        "minAdults": minAdults,
        "roomType": roomTypeEnumValues.reverse[roomType],
        "characteristicCode": characteristicCode,
        "roomFacilities": roomFacilities == null ? null : List<dynamic>.from(roomFacilities.map((x) => x.toJson())),
        "roomStays": roomStays == null ? null : List<dynamic>.from(roomStays.map((x) => x.toJson())),
        "PMSRoomCode": pmsRoomCode == null ? null : pmsRoomCode,
    };
}

class RoomFacility {
    RoomFacility({
        this.facilityCode,
        this.facilityGroupCode,
        this.number,
        this.indYesOrNo,
        this.voucher,
        this.indLogic,
        this.indFee,
    });

    int facilityCode;
    int facilityGroupCode;
    int number;
    bool indYesOrNo;
    bool voucher;
    bool indLogic;
    bool indFee;

    factory RoomFacility.fromJson(Map<String, dynamic> json) => RoomFacility(
        facilityCode: json["facilityCode"],
        facilityGroupCode: json["facilityGroupCode"],
        number: json["number"] == null ? null : json["number"],
        indYesOrNo: json["indYesOrNo"] == null ? null : json["indYesOrNo"],
        voucher: json["voucher"],
        indLogic: json["indLogic"] == null ? null : json["indLogic"],
        indFee: json["indFee"] == null ? null : json["indFee"],
    );

    Map<String, dynamic> toJson() => {
        "facilityCode": facilityCode,
        "facilityGroupCode": facilityGroupCode,
        "number": number == null ? null : number,
        "indYesOrNo": indYesOrNo == null ? null : indYesOrNo,
        "voucher": voucher,
        "indLogic": indLogic == null ? null : indLogic,
        "indFee": indFee == null ? null : indFee,
    };
}

class RoomStay {
    RoomStay({
        this.stayType,
        this.order,
        this.description,
        this.roomStayFacilities,
    });

    StayType stayType;
    String order;
    Description description;
    List<RoomStayFacility> roomStayFacilities;

    factory RoomStay.fromJson(Map<String, dynamic> json) => RoomStay(
        stayType: stayTypeValues.map[json["stayType"]],
        order: json["order"],
        description: json["description"] == null ? null : descriptionValues.map[json["description"]],
        roomStayFacilities: json["roomStayFacilities"] == null ? null : List<RoomStayFacility>.from(json["roomStayFacilities"].map((x) => RoomStayFacility.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "stayType": stayTypeValues.reverse[stayType],
        "order": order,
        "description": description == null ? null : descriptionValues.reverse[description],
        "roomStayFacilities": roomStayFacilities == null ? null : List<dynamic>.from(roomStayFacilities.map((x) => x.toJson())),
    };
}

enum Description { BED_ROOM }

final descriptionValues = EnumValues({
    "Bed room": Description.BED_ROOM
});

class RoomStayFacility {
    RoomStayFacility({
        this.facilityCode,
        this.facilityGroupCode,
        this.number,
    });

    int facilityCode;
    int facilityGroupCode;
    int number;

    factory RoomStayFacility.fromJson(Map<String, dynamic> json) => RoomStayFacility(
        facilityCode: json["facilityCode"],
        facilityGroupCode: json["facilityGroupCode"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "facilityCode": facilityCode,
        "facilityGroupCode": facilityGroupCode,
        "number": number,
    };
}

enum StayType { BED, LIV }

final stayTypeValues = EnumValues({
    "BED": StayType.BED,
    "LIV": StayType.LIV
});

class Terminal {
    Terminal({
        this.terminalCode,
        this.distance,
    });

    TerminalCode terminalCode;
    int distance;

    factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
        terminalCode: terminalCodeValues.map[json["terminalCode"]],
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "terminalCode": terminalCodeValues.reverse[terminalCode],
        "distance": distance,
    };
}

enum TerminalCode { CGK, TUGU, JRA }

final terminalCodeValues = EnumValues({
    "CGK": TerminalCode.CGK,
    "JRA": TerminalCode.JRA,
    "TUGU": TerminalCode.TUGU
});

class Wildcard {
    Wildcard({
        this.roomType,
        this.roomCode,
        this.characteristicCode,
        this.hotelRoomDescription,
    });

    String roomType;
    RoomTypeEnum roomCode;
    String characteristicCode;
    City hotelRoomDescription;

    factory Wildcard.fromJson(Map<String, dynamic> json) => Wildcard(
        roomType: json["roomType"],
        roomCode: roomTypeEnumValues.map[json["roomCode"]],
        characteristicCode: json["characteristicCode"],
        hotelRoomDescription: City.fromJson(json["hotelRoomDescription"]),
    );

    Map<String, dynamic> toJson() => {
        "roomType": roomType,
        "roomCode": roomTypeEnumValues.reverse[roomCode],
        "characteristicCode": characteristicCode,
        "hotelRoomDescription": hotelRoomDescription.toJson(),
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
