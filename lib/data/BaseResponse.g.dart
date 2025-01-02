// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomResponse _$CustomResponseFromJson(Map<String, dynamic> json) =>
    CustomResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      numOfNotifications: json['numOfNotifications'] as String?,
    );

Map<String, dynamic> _$CustomResponseToJson(CustomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotifications': instance.numOfNotifications,
    };

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    ContactResponse(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'link': instance.link,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      customer: json['customer'] == null
          ? null
          : CustomResponse.fromJson(json['customer'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : ContactResponse.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
