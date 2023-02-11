// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get datedebut => throw _privateConstructorUsedError;
  String? get datefin => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get thread => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String name,
      String description,
      String? datedebut,
      String? datefin,
      String? duration,
      String? state,
      String? thread});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? datedebut = freezed,
    Object? datefin = freezed,
    Object? duration = freezed,
    Object? state = freezed,
    Object? thread = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      datedebut: freezed == datedebut
          ? _value.datedebut
          : datedebut // ignore: cast_nullable_to_non_nullable
              as String?,
      datefin: freezed == datefin
          ? _value.datefin
          : datefin // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      thread: freezed == thread
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String? datedebut,
      String? datefin,
      String? duration,
      String? state,
      String? thread});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? datedebut = freezed,
    Object? datefin = freezed,
    Object? duration = freezed,
    Object? state = freezed,
    Object? thread = freezed,
  }) {
    return _then(_$_Task(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      datedebut: freezed == datedebut
          ? _value.datedebut
          : datedebut // ignore: cast_nullable_to_non_nullable
              as String?,
      datefin: freezed == datefin
          ? _value.datefin
          : datefin // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      thread: freezed == thread
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {required this.name,
      required this.description,
      this.datedebut,
      this.datefin,
      this.duration,
      this.state = 'incompleted',
      this.thread});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String? datedebut;
  @override
  final String? datefin;
  @override
  final String? duration;
  @override
  @JsonKey()
  final String? state;
  @override
  final String? thread;

  @override
  String toString() {
    return 'Task(name: $name, description: $description, datedebut: $datedebut, datefin: $datefin, duration: $duration, state: $state, thread: $thread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.datedebut, datedebut) ||
                other.datedebut == datedebut) &&
            (identical(other.datefin, datefin) || other.datefin == datefin) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.thread, thread) || other.thread == thread));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, datedebut,
      datefin, duration, state, thread);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String name,
      required final String description,
      final String? datedebut,
      final String? datefin,
      final String? duration,
      final String? state,
      final String? thread}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String? get datedebut;
  @override
  String? get datefin;
  @override
  String? get duration;
  @override
  String? get state;
  @override
  String? get thread;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
