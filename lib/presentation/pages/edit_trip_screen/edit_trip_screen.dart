import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/domain/entities/trip/trip.dart';

class EditTripPage extends HookConsumerWidget {
  const EditTripPage({Key? key, required this.tripId}) : super(key: key);
  final int tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the trip details from a provider
    // final trip = ref.watch(tripProvider(tripId));
    final trip = Trip(id: "0001", name: "name");

    // Local state for the trip details
    final nameController = useTextEditingController(text: trip.name);
    final locationController = useTextEditingController(text: trip.destination);
    final dateController = useTextEditingController(text: trip.date.toString());
    final descriptionController =
        useTextEditingController(text: trip.description);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Trip'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter trip name',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                hintText: 'Enter trip location',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'Enter trip date',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter trip description',
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Delete the trip from the provider
                    // ref.read(tripListProvider.notifier).deleteTrip(tripId);

                    // Navigate back to the trip list page
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Delete'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Update the trip details in the provider
                    // ref.read(tripListProvider.notifier).updateTrip(
                    //       tripId,
                    //       nameController.text,
                    //       locationController.text,
                    //       DateTime.parse(dateController.text),
                    //       descriptionController.text,
                    //     );

                    // Navigate back to the trip list page
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
