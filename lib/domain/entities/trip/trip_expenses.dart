import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_expenses.freezed.dart';
part 'trip_expenses.g.dart';

@freezed
class TripExpense with _$TripExpense {
  const factory TripExpense({
    required String name,
    @Default(0) int amount,
  }) = _TripExpense;

  factory TripExpense.fromJson(Map<String, dynamic> json) =>
      _$TripExpenseFromJson(json);
}
