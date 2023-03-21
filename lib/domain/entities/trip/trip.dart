import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiere_note_sp/domain/entities/trip/trip_expenses.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    @Default("") String destination,
    @Default("") String description,
    required String name,
    @Default("") String date,
    @Default(false) bool riskAssessment,
    @Default(0) int estimatedBudget,
    @Default(0) int numberPeople,
    @Default([]) List<TripExpense> listExpenses,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
