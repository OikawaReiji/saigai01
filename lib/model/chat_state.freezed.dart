// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatState _$ChatStateFromJson(Map<String, dynamic> json) {
  return _ChatState.fromJson(json);
}

/// @nodoc
mixin _$ChatState {
  @TimestampConverter()
  DateTime get registeTime => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  String get receiver => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get imageFlg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {@TimestampConverter() DateTime registeTime,
      String sender,
      String receiver,
      String text,
      String imageUrl,
      bool imageFlg});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registeTime = null,
    Object? sender = null,
    Object? receiver = null,
    Object? text = null,
    Object? imageUrl = null,
    Object? imageFlg = null,
  }) {
    return _then(_value.copyWith(
      registeTime: null == registeTime
          ? _value.registeTime
          : registeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageFlg: null == imageFlg
          ? _value.imageFlg
          : imageFlg // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampConverter() DateTime registeTime,
      String sender,
      String receiver,
      String text,
      String imageUrl,
      bool imageFlg});
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatState>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registeTime = null,
    Object? sender = null,
    Object? receiver = null,
    Object? text = null,
    Object? imageUrl = null,
    Object? imageFlg = null,
  }) {
    return _then(_$_ChatState(
      registeTime: null == registeTime
          ? _value.registeTime
          : registeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageFlg: null == imageFlg
          ? _value.imageFlg
          : imageFlg // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatState extends _ChatState {
  _$_ChatState(
      {@TimestampConverter() required this.registeTime,
      this.sender = "",
      this.receiver = "",
      this.text = "",
      this.imageUrl = "",
      this.imageFlg = false})
      : super._();

  factory _$_ChatState.fromJson(Map<String, dynamic> json) =>
      _$$_ChatStateFromJson(json);

  @override
  @TimestampConverter()
  final DateTime registeTime;
  @override
  @JsonKey()
  final String sender;
  @override
  @JsonKey()
  final String receiver;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final bool imageFlg;

  @override
  String toString() {
    return 'ChatState(registeTime: $registeTime, sender: $sender, receiver: $receiver, text: $text, imageUrl: $imageUrl, imageFlg: $imageFlg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            (identical(other.registeTime, registeTime) ||
                other.registeTime == registeTime) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageFlg, imageFlg) ||
                other.imageFlg == imageFlg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, registeTime, sender, receiver, text, imageUrl, imageFlg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatStateToJson(
      this,
    );
  }
}

abstract class _ChatState extends ChatState {
  factory _ChatState(
      {@TimestampConverter() required final DateTime registeTime,
      final String sender,
      final String receiver,
      final String text,
      final String imageUrl,
      final bool imageFlg}) = _$_ChatState;
  _ChatState._() : super._();

  factory _ChatState.fromJson(Map<String, dynamic> json) =
      _$_ChatState.fromJson;

  @override
  @TimestampConverter()
  DateTime get registeTime;
  @override
  String get sender;
  @override
  String get receiver;
  @override
  String get text;
  @override
  String get imageUrl;
  @override
  bool get imageFlg;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
