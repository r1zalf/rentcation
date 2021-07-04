import 'package:rentcation/model/entity/user.dart';
import 'package:rentcation/model/entity/web_response.dart';

class LoginResponse  extends WebResponse<UserModel>{
  LoginResponse(Meta meta, UserModel data) : super(meta, data);
  
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      Meta.fromJson(json['meta']),
      UserModel.fromJson(json['data']),
    );
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meta'] = this.meta.toJson();
    data['data'] = this.data.toJson();
    return data;
  }
}