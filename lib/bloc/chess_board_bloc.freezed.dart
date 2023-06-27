// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chess_board_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChessBoardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(Figure figure) getAvailableFieldsToMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Figure figure)? getAvailableFieldsToMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Figure figure)? getAvailableFieldsToMove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetAvailableFieldsToMove value)
        getAvailableFieldsToMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetAvailableFieldsToMove value)?
        getAvailableFieldsToMove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetAvailableFieldsToMove value)? getAvailableFieldsToMove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChessBoardEventCopyWith<$Res> {
  factory $ChessBoardEventCopyWith(
          ChessBoardEvent value, $Res Function(ChessBoardEvent) then) =
      _$ChessBoardEventCopyWithImpl<$Res, ChessBoardEvent>;
}

/// @nodoc
class _$ChessBoardEventCopyWithImpl<$Res, $Val extends ChessBoardEvent>
    implements $ChessBoardEventCopyWith<$Res> {
  _$ChessBoardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$ChessBoardEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'ChessBoardEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(Figure figure) getAvailableFieldsToMove,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Figure figure)? getAvailableFieldsToMove,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Figure figure)? getAvailableFieldsToMove,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetAvailableFieldsToMove value)
        getAvailableFieldsToMove,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetAvailableFieldsToMove value)?
        getAvailableFieldsToMove,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetAvailableFieldsToMove value)? getAvailableFieldsToMove,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ChessBoardEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_GetAvailableFieldsToMoveCopyWith<$Res> {
  factory _$$_GetAvailableFieldsToMoveCopyWith(
          _$_GetAvailableFieldsToMove value,
          $Res Function(_$_GetAvailableFieldsToMove) then) =
      __$$_GetAvailableFieldsToMoveCopyWithImpl<$Res>;
  @useResult
  $Res call({Figure figure});

  $FigureCopyWith<$Res> get figure;
}

/// @nodoc
class __$$_GetAvailableFieldsToMoveCopyWithImpl<$Res>
    extends _$ChessBoardEventCopyWithImpl<$Res, _$_GetAvailableFieldsToMove>
    implements _$$_GetAvailableFieldsToMoveCopyWith<$Res> {
  __$$_GetAvailableFieldsToMoveCopyWithImpl(_$_GetAvailableFieldsToMove _value,
      $Res Function(_$_GetAvailableFieldsToMove) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figure = null,
  }) {
    return _then(_$_GetAvailableFieldsToMove(
      null == figure
          ? _value.figure
          : figure // ignore: cast_nullable_to_non_nullable
              as Figure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FigureCopyWith<$Res> get figure {
    return $FigureCopyWith<$Res>(_value.figure, (value) {
      return _then(_value.copyWith(figure: value));
    });
  }
}

/// @nodoc

class _$_GetAvailableFieldsToMove implements _GetAvailableFieldsToMove {
  const _$_GetAvailableFieldsToMove(this.figure);

  @override
  final Figure figure;

  @override
  String toString() {
    return 'ChessBoardEvent.getAvailableFieldsToMove(figure: $figure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAvailableFieldsToMove &&
            (identical(other.figure, figure) || other.figure == figure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, figure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAvailableFieldsToMoveCopyWith<_$_GetAvailableFieldsToMove>
      get copyWith => __$$_GetAvailableFieldsToMoveCopyWithImpl<
          _$_GetAvailableFieldsToMove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(Figure figure) getAvailableFieldsToMove,
  }) {
    return getAvailableFieldsToMove(figure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Figure figure)? getAvailableFieldsToMove,
  }) {
    return getAvailableFieldsToMove?.call(figure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Figure figure)? getAvailableFieldsToMove,
    required TResult orElse(),
  }) {
    if (getAvailableFieldsToMove != null) {
      return getAvailableFieldsToMove(figure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetAvailableFieldsToMove value)
        getAvailableFieldsToMove,
  }) {
    return getAvailableFieldsToMove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetAvailableFieldsToMove value)?
        getAvailableFieldsToMove,
  }) {
    return getAvailableFieldsToMove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetAvailableFieldsToMove value)? getAvailableFieldsToMove,
    required TResult orElse(),
  }) {
    if (getAvailableFieldsToMove != null) {
      return getAvailableFieldsToMove(this);
    }
    return orElse();
  }
}

abstract class _GetAvailableFieldsToMove implements ChessBoardEvent {
  const factory _GetAvailableFieldsToMove(final Figure figure) =
      _$_GetAvailableFieldsToMove;

  Figure get figure;
  @JsonKey(ignore: true)
  _$$_GetAvailableFieldsToMoveCopyWith<_$_GetAvailableFieldsToMove>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChessBoardState {
  List<Figure> get figuresOnBoard => throw _privateConstructorUsedError;
  List<Figure> get figuresTaken => throw _privateConstructorUsedError;
  bool get isWhitePlayerTurn => throw _privateConstructorUsedError;
  List<int> get availableFieldsToMove => throw _privateConstructorUsedError;
  int? get currentlyClickedField => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChessBoardStateCopyWith<ChessBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChessBoardStateCopyWith<$Res> {
  factory $ChessBoardStateCopyWith(
          ChessBoardState value, $Res Function(ChessBoardState) then) =
      _$ChessBoardStateCopyWithImpl<$Res, ChessBoardState>;
  @useResult
  $Res call(
      {List<Figure> figuresOnBoard,
      List<Figure> figuresTaken,
      bool isWhitePlayerTurn,
      List<int> availableFieldsToMove,
      int? currentlyClickedField});
}

/// @nodoc
class _$ChessBoardStateCopyWithImpl<$Res, $Val extends ChessBoardState>
    implements $ChessBoardStateCopyWith<$Res> {
  _$ChessBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figuresOnBoard = null,
    Object? figuresTaken = null,
    Object? isWhitePlayerTurn = null,
    Object? availableFieldsToMove = null,
    Object? currentlyClickedField = freezed,
  }) {
    return _then(_value.copyWith(
      figuresOnBoard: null == figuresOnBoard
          ? _value.figuresOnBoard
          : figuresOnBoard // ignore: cast_nullable_to_non_nullable
              as List<Figure>,
      figuresTaken: null == figuresTaken
          ? _value.figuresTaken
          : figuresTaken // ignore: cast_nullable_to_non_nullable
              as List<Figure>,
      isWhitePlayerTurn: null == isWhitePlayerTurn
          ? _value.isWhitePlayerTurn
          : isWhitePlayerTurn // ignore: cast_nullable_to_non_nullable
              as bool,
      availableFieldsToMove: null == availableFieldsToMove
          ? _value.availableFieldsToMove
          : availableFieldsToMove // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentlyClickedField: freezed == currentlyClickedField
          ? _value.currentlyClickedField
          : currentlyClickedField // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChessBoardStateCopyWith<$Res>
    implements $ChessBoardStateCopyWith<$Res> {
  factory _$$_ChessBoardStateCopyWith(
          _$_ChessBoardState value, $Res Function(_$_ChessBoardState) then) =
      __$$_ChessBoardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Figure> figuresOnBoard,
      List<Figure> figuresTaken,
      bool isWhitePlayerTurn,
      List<int> availableFieldsToMove,
      int? currentlyClickedField});
}

/// @nodoc
class __$$_ChessBoardStateCopyWithImpl<$Res>
    extends _$ChessBoardStateCopyWithImpl<$Res, _$_ChessBoardState>
    implements _$$_ChessBoardStateCopyWith<$Res> {
  __$$_ChessBoardStateCopyWithImpl(
      _$_ChessBoardState _value, $Res Function(_$_ChessBoardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figuresOnBoard = null,
    Object? figuresTaken = null,
    Object? isWhitePlayerTurn = null,
    Object? availableFieldsToMove = null,
    Object? currentlyClickedField = freezed,
  }) {
    return _then(_$_ChessBoardState(
      figuresOnBoard: null == figuresOnBoard
          ? _value._figuresOnBoard
          : figuresOnBoard // ignore: cast_nullable_to_non_nullable
              as List<Figure>,
      figuresTaken: null == figuresTaken
          ? _value._figuresTaken
          : figuresTaken // ignore: cast_nullable_to_non_nullable
              as List<Figure>,
      isWhitePlayerTurn: null == isWhitePlayerTurn
          ? _value.isWhitePlayerTurn
          : isWhitePlayerTurn // ignore: cast_nullable_to_non_nullable
              as bool,
      availableFieldsToMove: null == availableFieldsToMove
          ? _value._availableFieldsToMove
          : availableFieldsToMove // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentlyClickedField: freezed == currentlyClickedField
          ? _value.currentlyClickedField
          : currentlyClickedField // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ChessBoardState implements _ChessBoardState {
  const _$_ChessBoardState(
      {final List<Figure> figuresOnBoard = const [],
      final List<Figure> figuresTaken = const [],
      this.isWhitePlayerTurn = true,
      final List<int> availableFieldsToMove = const [],
      this.currentlyClickedField})
      : _figuresOnBoard = figuresOnBoard,
        _figuresTaken = figuresTaken,
        _availableFieldsToMove = availableFieldsToMove;

  final List<Figure> _figuresOnBoard;
  @override
  @JsonKey()
  List<Figure> get figuresOnBoard {
    if (_figuresOnBoard is EqualUnmodifiableListView) return _figuresOnBoard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_figuresOnBoard);
  }

  final List<Figure> _figuresTaken;
  @override
  @JsonKey()
  List<Figure> get figuresTaken {
    if (_figuresTaken is EqualUnmodifiableListView) return _figuresTaken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_figuresTaken);
  }

  @override
  @JsonKey()
  final bool isWhitePlayerTurn;
  final List<int> _availableFieldsToMove;
  @override
  @JsonKey()
  List<int> get availableFieldsToMove {
    if (_availableFieldsToMove is EqualUnmodifiableListView)
      return _availableFieldsToMove;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableFieldsToMove);
  }

  @override
  final int? currentlyClickedField;

  @override
  String toString() {
    return 'ChessBoardState(figuresOnBoard: $figuresOnBoard, figuresTaken: $figuresTaken, isWhitePlayerTurn: $isWhitePlayerTurn, availableFieldsToMove: $availableFieldsToMove, currentlyClickedField: $currentlyClickedField)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChessBoardState &&
            const DeepCollectionEquality()
                .equals(other._figuresOnBoard, _figuresOnBoard) &&
            const DeepCollectionEquality()
                .equals(other._figuresTaken, _figuresTaken) &&
            (identical(other.isWhitePlayerTurn, isWhitePlayerTurn) ||
                other.isWhitePlayerTurn == isWhitePlayerTurn) &&
            const DeepCollectionEquality()
                .equals(other._availableFieldsToMove, _availableFieldsToMove) &&
            (identical(other.currentlyClickedField, currentlyClickedField) ||
                other.currentlyClickedField == currentlyClickedField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_figuresOnBoard),
      const DeepCollectionEquality().hash(_figuresTaken),
      isWhitePlayerTurn,
      const DeepCollectionEquality().hash(_availableFieldsToMove),
      currentlyClickedField);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChessBoardStateCopyWith<_$_ChessBoardState> get copyWith =>
      __$$_ChessBoardStateCopyWithImpl<_$_ChessBoardState>(this, _$identity);
}

abstract class _ChessBoardState implements ChessBoardState {
  const factory _ChessBoardState(
      {final List<Figure> figuresOnBoard,
      final List<Figure> figuresTaken,
      final bool isWhitePlayerTurn,
      final List<int> availableFieldsToMove,
      final int? currentlyClickedField}) = _$_ChessBoardState;

  @override
  List<Figure> get figuresOnBoard;
  @override
  List<Figure> get figuresTaken;
  @override
  bool get isWhitePlayerTurn;
  @override
  List<int> get availableFieldsToMove;
  @override
  int? get currentlyClickedField;
  @override
  @JsonKey(ignore: true)
  _$$_ChessBoardStateCopyWith<_$_ChessBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
