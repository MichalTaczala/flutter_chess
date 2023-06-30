import 'package:flutter_chess/enums/figure_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'figure.freezed.dart';

@freezed
class Figure with _$Figure {
  const Figure._();

  const factory Figure({
    required bool isWhite,
    required FigureTypeEnum figureType,
    required int field,
  }) = _Figure;
  @override
  String toString() {
    return "${isWhite ? "Biały" : "Czarny"} $figureType";
  }
}
