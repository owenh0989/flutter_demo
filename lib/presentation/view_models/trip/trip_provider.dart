import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/domain/entities/trip/trip.dart';

final tripProvider = ChangeNotifierProvider((ref) => TripList());

class TripList extends ChangeNotifier {
  List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  void deleteTrip(String tripId) {
    _trips.removeWhere((trip) => trip.id == tripId);
    notifyListeners();
  }

  void updateTrip(String tripId, Trip newTrip) {
    final tripIndex = _trips.indexWhere((trip) => trip.id == tripId);
    if (tripIndex >= 0) {
      _trips[tripIndex] = newTrip.copyWith(id: tripId);
      notifyListeners();
    }
  }
}
