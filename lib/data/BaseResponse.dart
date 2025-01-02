import 'package:json_annotation/json_annotation.dart';
 part 'BaseResponse.g.dart';

class BaseResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'numOfNotifications')
  String? numOfNotifications;

  CustomResponse({this.id, this.name, this.numOfNotifications});

  // fromJson
  factory CustomResponse.fromJson(Map<String, dynamic> json) => _$CustomResponseFromJson(json);
  // toJson
  Map<String, dynamic> toJson() => _$CustomResponseToJson(this);

}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'link')
  String? link;

  ContactResponse({this.email, this.phone, this.link});

  // fromJson
  factory ContactResponse.fromJson(Map<String, dynamic> json) => _$ContactResponseFromJson(json);
  // toJson
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: 'customer')
  CustomResponse? customer;
  @JsonKey(name: 'contacts')
  ContactResponse? contacts;

  AuthenticationResponse({this.customer, this.contacts});


// fromJson
factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);
// toJson
Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

}
