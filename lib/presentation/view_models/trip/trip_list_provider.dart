import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/domain/entities/trip/trip.dart';

final tripListProvider = StateNotifierProvider((ref) => TripList([]));

class TripList extends StateNotifier<List<Trip>> {
  TripList(List<Trip> trips) : super(trips);

  void addTrip(Trip trip) {
    state = [...state, trip];
  }

  void deleteTrip(String tripId) {
    state = state.where((trip) => trip.id != tripId).toList();
  }

  void updateTrip(String tripId, Trip newTrip) {
    final tripIndex = state.indexWhere((trip) => trip.id == tripId);
    if (tripIndex >= 0) {
      state[tripIndex] = newTrip.copyWith(id: tripId);
    }
  }
}
