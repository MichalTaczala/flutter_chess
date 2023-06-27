import 'package:flutter_chess/enums/figure_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'figure.freezed.dart';
// part 'main.g.dart';

@freezed
class Figure with _$Figure {
  const factory Figure({
    required bool isWhite,
    required FigureTypeEnum figureType,
    required int field,
  }) = _Figure;
}
