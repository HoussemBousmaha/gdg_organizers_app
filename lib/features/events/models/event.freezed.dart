// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<User>? get organizers => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  String? get datedebut => throw _privateConstructorUsedError;
  String? get datefin => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get thread => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      String image,
      List<User>? organizers,
      List<Task>? tasks,
      String? datedebut,
      String? datefin,
      String? state,
      String? thread});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? organizers = freezed,
    Object? tasks = freezed,
    Object? datedebut = freezed,
    Object? datefin = freezed,
    Object? state = freezed,
    Object? thread = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      organizers: freezed == organizers
          ? _value.organizers
          : organizers // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      datedebut: freezed == datedebut
          ? _value.datedebut
          : datedebut // ignore: cast_nullable_to_non_nullable
              as String?,
      datefin: freezed == datefin
          ? _value.datefin
          : datefin // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      String image,
      List<User>? organizers,
      List<Task>? tasks,
      String? datedebut,
      String? datefin,
      String? state,
      String? thread});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? organizers = freezed,
    Object? tasks = freezed,
    Object? datedebut = freezed,
    Object? datefin = freezed,
    Object? state = freezed,
    Object? thread = freezed,
  }) {
    return _then(_$_Event(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      organizers: freezed == organizers
          ? _value._organizers
          : organizers // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      datedebut: freezed == datedebut
          ? _value.datedebut
          : datedebut // ignore: cast_nullable_to_non_nullable
              as String?,
      datefin: freezed == datefin
          ? _value.datefin
          : datefin // ignore: cast_nullable_to_non_nullable
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
class _$_Event with DiagnosticableTreeMixin implements _Event {
  const _$_Event(
      {this.id,
      required this.name,
      required this.description,
      required this.image,
      final List<User>? organizers,
      final List<Task>? tasks,
      this.datedebut,
      this.datefin,
      this.state = 'inactive',
      this.thread})
      : _organizers = organizers,
        _tasks = tasks;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  final List<User>? _organizers;
  @override
  List<User>? get organizers {
    final value = _organizers;
    if (value == null) return null;
    if (_organizers is EqualUnmodifiableListView) return _organizers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Task>? _tasks;
  @override
  List<Task>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? datedebut;
  @override
  final String? datefin;
  @override
  @JsonKey()
  final String? state;
  @override
  final String? thread;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, name: $name, description: $description, image: $image, organizers: $organizers, tasks: $tasks, datedebut: $datedebut, datefin: $datefin, state: $state, thread: $thread)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('organizers', organizers))
      ..add(DiagnosticsProperty('tasks', tasks))
      ..add(DiagnosticsProperty('datedebut', datedebut))
      ..add(DiagnosticsProperty('datefin', datefin))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('thread', thread));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._organizers, _organizers) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.datedebut, datedebut) ||
                other.datedebut == datedebut) &&
            (identical(other.datefin, datefin) || other.datefin == datefin) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.thread, thread) || other.thread == thread));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      image,
      const DeepCollectionEquality().hash(_organizers),
      const DeepCollectionEquality().hash(_tasks),
      datedebut,
      datefin,
      state,
      thread);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {final String? id,
      required final String name,
      required final String description,
      required final String image,
      final List<User>? organizers,
      final List<Task>? tasks,
      final String? datedebut,
      final String? datefin,
      final String? state,
      final String? thread}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  List<User>? get organizers;
  @override
  List<Task>? get tasks;
  @override
  String? get datedebut;
  @override
  String? get datefin;
  @override
  String? get state;
  @override
  String? get thread;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
