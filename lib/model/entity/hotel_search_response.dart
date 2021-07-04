// To parse this JSON data, do
//
//     final hotelSearchResponse = hotelSearchResponseFromJson(jsonString);

import 'dart:convert';

HotelSearchResponse hotelSearchResponseFromJson(String str) => HotelSearchResponse.fromJson(json.decode(str));

String hotelSearchResponseToJson(HotelSearchResponse data) => json.encode(data.toJson());

class HotelSearchResponse {
    HotelSearchResponse({
        this.auditData,
        this.hotels,
    });

    AuditData auditData;
    Hotels hotels;

    factory HotelSearchResponse.fromJson(Map<String, dynamic> json) => HotelSearchResponse(
        auditData: AuditData.fromJson(json["auditData"]),
        hotels: Hotels.fromJson(json["hotels"]),
    );

    Map<String, dynamic> toJson() => {
        "auditData": auditData.toJson(),
        "hotels": hotels.toJson(),
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
        this.token,
        this.internal,
    });

    String processTime;
    DateTime timestamp;
    String requestHost;
    String serverId;
    String environment;
    String release;
    String token;
    String internal;

    factory AuditData.fromJson(Map<String, dynamic> json) => AuditData(
        processTime: json["processTime"],
        timestamp: DateTime.parse(json["timestamp"]),
        requestHost: json["requestHost"],
        serverId: json["serverId"],
        environment: json["environment"],
        release: json["release"],
        token: json["token"],
        internal: json["internal"],
    );

    Map<String, dynamic> toJson() => {
        "processTime": processTime,
        "timestamp": timestamp.toIso8601String(),
        "requestHost": requestHost,
        "serverId": serverId,
        "environment": environment,
        "release": release,
        "token": token,
        "internal": internal,
    };
}

class Hotels {
    Hotels({
        this.hotels,
        this.checkIn,
        this.total,
        this.checkOut,
    });

    List<Hotelx> hotels;
    DateTime checkIn;
    int total;
    DateTime checkOut;

    factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
        hotels: List<Hotelx>.from(json["hotels"].map((x) => Hotelx.fromJson(x))),
        checkIn: DateTime.parse(json["checkIn"]),
        total: json["total"],
        checkOut: DateTime.parse(json["checkOut"]),
    );

    Map<String, dynamic> toJson() => {
        "hotels": List<dynamic>.from(hotels.map((x) => x.toJson())),
        "checkIn": "${checkIn.year.toString().padLeft(4, '0')}-${checkIn.month.toString().padLeft(2, '0')}-${checkIn.day.toString().padLeft(2, '0')}",
        "total": total,
        "checkOut": "${checkOut.year.toString().padLeft(4, '0')}-${checkOut.month.toString().padLeft(2, '0')}-${checkOut.day.toString().padLeft(2, '0')}",
    };
}

class Hotelx {
    Hotelx({
        this.code,
        this.name,
        this.categoryCode,
        this.categoryName,
        this.destinationCode,
        this.destinationName,
        this.zoneCode,
        this.zoneName,
        this.latitude,
        this.longitude,
        this.rooms,
        this.minRate,
        this.maxRate,
        this.currency,
    });

    int code;
    String name;
    CategoryCode categoryCode;
    CategoryName categoryName;
    DestinationCode destinationCode;
    Name destinationName;
    int zoneCode;
    Name zoneName;
    String latitude;
    String longitude;
    List<Room> rooms;
    String minRate;
    String maxRate;
    Currency currency;

    factory Hotelx.fromJson(Map<String, dynamic> json) => Hotelx(
        code: json["code"],
        name: json["name"],
        categoryCode: categoryCodeValues.map[json["categoryCode"]],
        categoryName: categoryNameValues.map[json["categoryName"]],
        destinationCode: destinationCodeValues.map[json["destinationCode"]],
        destinationName: nameValues.map[json["destinationName"]],
        zoneCode: json["zoneCode"],
        zoneName: nameValues.map[json["zoneName"]],
        latitude: json["latitude"],
        longitude: json["longitude"],
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        minRate: json["minRate"],
        maxRate: json["maxRate"],
        currency: currencyValues.map[json["currency"]],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "categoryCode": categoryCodeValues.reverse[categoryCode],
        "categoryName": categoryNameValues.reverse[categoryName],
        "destinationCode": destinationCodeValues.reverse[destinationCode],
        "destinationName": nameValues.reverse[destinationName],
        "zoneCode": zoneCode,
        "zoneName": nameValues.reverse[zoneName],
        "latitude": latitude,
        "longitude": longitude,
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
        "minRate": minRate,
        "maxRate": maxRate,
        "currency": currencyValues.reverse[currency],
    };
}

enum CategoryCode { THE_4_EST, THE_5_EST, THE_2_EST, THE_3_EST }

final categoryCodeValues = EnumValues({
    "2EST": CategoryCode.THE_2_EST,
    "3EST": CategoryCode.THE_3_EST,
    "4EST": CategoryCode.THE_4_EST,
    "5EST": CategoryCode.THE_5_EST
});

enum CategoryName { THE_4_STARS, THE_5_STARS, THE_2_STARS, THE_3_STARS }

final categoryNameValues = EnumValues({
    "2 STARS": CategoryName.THE_2_STARS,
    "3 STARS": CategoryName.THE_3_STARS,
    "4 STARS": CategoryName.THE_4_STARS,
    "5 STARS": CategoryName.THE_5_STARS
});

enum Currency { EUR }

final currencyValues = EnumValues({
    "EUR": Currency.EUR
});

enum DestinationCode { BDO }

final destinationCodeValues = EnumValues({
    "BDO": DestinationCode.BDO
});

enum Name { BANDUNG }

final nameValues = EnumValues({
    "Bandung": Name.BANDUNG
});

class Room {
    Room({
        this.code,
        this.name,
        this.rates,
    });

    String code;
    String name;
    List<Rate> rates;

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        code: json["code"],
        name: json["name"],
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
    };
}

class Rate {
    Rate({
        this.rateKey,
        this.rateClass,
        this.rateType,
        this.net,
        this.allotment,
        this.paymentType,
        this.packaging,
        this.boardCode,
        this.boardName,
        this.cancellationPolicies,
        this.rooms,
        this.adults,
        this.children,
        this.promotions,
        this.rateCommentsId,
        this.sellingRate,
        this.hotelMandatory,
        this.offers,
    });

    String rateKey;
    RateClass rateClass;
    RateType rateType;
    String net;
    int allotment;
    PaymentType paymentType;
    bool packaging;
    BoardCode boardCode;
    BoardName boardName;
    List<CancellationPolicy> cancellationPolicies;
    int rooms;
    int adults;
    int children;
    List<Promotion> promotions;
    String rateCommentsId;
    String sellingRate;
    bool hotelMandatory;
    List<Offer> offers;

    factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        rateKey: json["rateKey"],
        rateClass: rateClassValues.map[json["rateClass"]],
        rateType: rateTypeValues.map[json["rateType"]],
        net: json["net"],
        allotment: json["allotment"],
        paymentType: paymentTypeValues.map[json["paymentType"]],
        packaging: json["packaging"],
        boardCode: boardCodeValues.map[json["boardCode"]],
        boardName: boardNameValues.map[json["boardName"]],
        cancellationPolicies: json["cancellationPolicies"] == null ? null : List<CancellationPolicy>.from(json["cancellationPolicies"].map((x) => CancellationPolicy.fromJson(x))),
        rooms: json["rooms"],
        adults: json["adults"],
        children: json["children"],
        promotions: json["promotions"] == null ? null : List<Promotion>.from(json["promotions"].map((x) => Promotion.fromJson(x))),
        rateCommentsId: json["rateCommentsId"] == null ? null : json["rateCommentsId"],
        sellingRate: json["sellingRate"] == null ? null : json["sellingRate"],
        hotelMandatory: json["hotelMandatory"] == null ? null : json["hotelMandatory"],
        offers: json["offers"] == null ? null : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rateKey": rateKey,
        "rateClass": rateClassValues.reverse[rateClass],
        "rateType": rateTypeValues.reverse[rateType],
        "net": net,
        "allotment": allotment,
        "paymentType": paymentTypeValues.reverse[paymentType],
        "packaging": packaging,
        "boardCode": boardCodeValues.reverse[boardCode],
        "boardName": boardNameValues.reverse[boardName],
        "cancellationPolicies": cancellationPolicies == null ? null : List<dynamic>.from(cancellationPolicies.map((x) => x.toJson())),
        "rooms": rooms,
        "adults": adults,
        "children": children,
        "promotions": promotions == null ? null : List<dynamic>.from(promotions.map((x) => x.toJson())),
        "rateCommentsId": rateCommentsId == null ? null : rateCommentsId,
        "sellingRate": sellingRate == null ? null : sellingRate,
        "hotelMandatory": hotelMandatory == null ? null : hotelMandatory,
        "offers": offers == null ? null : List<dynamic>.from(offers.map((x) => x.toJson())),
    };
}

enum BoardCode { RO, BB, HB, FB }

final boardCodeValues = EnumValues({
    "BB": BoardCode.BB,
    "FB": BoardCode.FB,
    "HB": BoardCode.HB,
    "RO": BoardCode.RO
});

enum BoardName { ROOM_ONLY, BED_AND_BREAKFAST, HALF_BOARD, FULL_BOARD }

final boardNameValues = EnumValues({
    "BED AND BREAKFAST": BoardName.BED_AND_BREAKFAST,
    "FULL BOARD": BoardName.FULL_BOARD,
    "HALF BOARD": BoardName.HALF_BOARD,
    "ROOM ONLY": BoardName.ROOM_ONLY
});

class CancellationPolicy {
    CancellationPolicy({
        this.amount,
        this.from,
    });

    String amount;
    DateTime from;

    factory CancellationPolicy.fromJson(Map<String, dynamic> json) => CancellationPolicy(
        amount: json["amount"],
        from: DateTime.parse(json["from"]),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "from": from.toIso8601String(),
    };
}

class Offer {
    Offer({
        this.code,
        this.name,
        this.amount,
    });

    String code;
    String name;
    String amount;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        code: json["code"],
        name: json["name"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "amount": amount,
    };
}

enum PaymentType { AT_WEB }

final paymentTypeValues = EnumValues({
    "AT_WEB": PaymentType.AT_WEB
});

class Promotion {
    Promotion({
        this.code,
        this.name,
    });

    String code;
    NameEnum name;

    factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        code: json["code"],
        name: nameEnumValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": nameEnumValues.reverse[name],
    };
}

enum NameEnum { NON_REFUNDABLE_RATE_NO_AMENDMENTS_PERMITTED }

final nameEnumValues = EnumValues({
    "Non-refundable rate. No amendments permitted": NameEnum.NON_REFUNDABLE_RATE_NO_AMENDMENTS_PERMITTED
});

enum RateClass { NOR, NRF }

final rateClassValues = EnumValues({
    "NOR": RateClass.NOR,
    "NRF": RateClass.NRF
});

enum RateType { RECHECK, BOOKABLE }

final rateTypeValues = EnumValues({
    "BOOKABLE": RateType.BOOKABLE,
    "RECHECK": RateType.RECHECK
});

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
