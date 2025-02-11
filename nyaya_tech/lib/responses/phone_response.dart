import 'dart:convert';

SendOtpResponse sendOtpResponseFromJson(String str) => SendOtpResponse.fromJson(json.decode(str));

String sendOtpResponseToJson(SendOtpResponse data) => json.encode(data.toJson());

class SendOtpResponse {
    int? status;
    bool? success;
    String? message;
    ErrData? errData;

    SendOtpResponse({
        this.status,
        this.success,
        this.message,
        this.errData,
    });

    factory SendOtpResponse.fromJson(Map<String, dynamic> json) => SendOtpResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        errData: json["errData"] == null ? null : ErrData.fromJson(json["errData"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "errData": errData?.toJson(),
    };
}

class ErrData {
    List<String>? phone;

    ErrData({
        this.phone,
    });

    factory ErrData.fromJson(Map<String, dynamic> json) => ErrData(
        phone: json["phone"] == null ? [] : List<String>.from(json["phone"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "phone": phone == null ? [] : List<dynamic>.from(phone!.map((x) => x)),
    };
}
