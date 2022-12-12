// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersState _$$_UsersStateFromJson(Map<String, dynamic> json) =>
    _$_UsersState(
      email: json['email'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      address: json['address'] as String? ?? "",
      friends: json['friends'] as List<dynamic>? ?? const [],
      phone: json['phone'] as String? ?? "",
      status: json['status'] as String? ?? "",
      profileImage: json['profileImage'] as String? ?? "",
      headerImage: json['headerImage'] as String? ?? "",
      notificationFlg: json['notificationFlg'] as bool? ?? true,
    );

Map<String, dynamic> _$$_UsersStateToJson(_$_UsersState instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'name': instance.name,
      'address': instance.address,
      'friends': instance.friends,
      'phone': instance.phone,
      'status': instance.status,
      'profileImage': instance.profileImage,
      'headerImage': instance.headerImage,
      'notificationFlg': instance.notificationFlg,
    };
