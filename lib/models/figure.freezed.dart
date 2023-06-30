// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Figure {
  bool get isWhite => throw _privateConstructorUsedError;
  FigureTypeEnum get figureType => throw _privateConstructorUsedError;
  int get field => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FigureCopyWith<Figure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigureCopyWith<$Res> {
  factory $FigureCopyWith(Figure value, $Res Function(Figure) then) =
      _$FigureCopyWithImpl<$Res, Figure>;
  @useResult
  $Res call({bool isWhite, FigureTypeEnum figureType, int field});
}

/// @nodoc
class _$FigureCopyWithImpl<$Res, $Val extends Figure>
    implements $FigureCopyWith<$Res> {
  _$FigureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWhite = null,
    Object? figureType = null,
    Object? field = null,
  }) {
    return _then(_value.copyWith(
      isWhite: null == isWhite
          ? _value.isWhite
          : isWhite // ignore: cast_nullable_to_non_nullable
              as bool,
      figureType: null == figureType
          ? _value.figureType
          : figureType // ignore: cast_nullable_to_non_nullable
              as FigureTypeEnum,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FigureCopyWith<$Res> implements $FigureCopyWith<$Res> {
  factory _$$_FigureCopyWith(_$_Figure value, $Res Function(_$_Figure) then) =
      __$$_FigureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isWhite, FigureTypeEnum figureType, int field});
}

/// @nodoc
class __$$_FigureCopyWithImpl<$Res>
    extends _$FigureCopyWithImpl<$Res, _$_Figure>
    implements _$$_FigureCopyWith<$Res> {
  __$$_FigureCopyWithImpl(_$_Figure _value, $Res Function(_$_Figure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWhite = null,
    Object? figureType = null,
    Object? field = null,
  }) {
    return _then(_$_Figure(
      isWhite: null == isWhite
          ? _value.isWhite
          : isWhite // ignore: cast_nullable_to_non_nullable
              as bool,
      figureType: null == figureType
          ? _value.figureType
          : figureType // ignore: cast_nullable_to_non_nullable
              as FigureTypeEnum,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Figure extends _Figure {
  const _$_Figure(
      {required this.isWhite, required this.figureType, required this.field})
      : super._();

  @override
  final bool isWhite;
  @override
  final FigureTypeEnum figureType;
  @override
  final int field;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Figure &&
            (identical(other.isWhite, isWhite) || other.isWhite == isWhite) &&
            (identical(other.figureType, figureType) ||
                other.figureType == figureType) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isWhite, figureType, field);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FigureCopyWith<_$_Figure> get copyWith =>
      __$$_FigureCopyWithImpl<_$_Figure>(this, _$identity);
}

abstract class _Figure extends Figure {
  const factory _Figure(
      {required final bool isWhite,
      required final FigureTypeEnum figureType,
      required final int field}) = _$_Figure;
  const _Figure._() : super._();

  @override
  bool get isWhite;
  @override
  FigureTypeEnum get figureType;
  @override
  int get field;
  @override
  @JsonKey(ignore: true)
  _$$_FigureCopyWith<_$_Figure> get copyWith =>
      throw _privateConstructorUsedError;
}
