import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/domain/entities/trip/trip.dart';
import 'package:lumiere_note_sp/gen/assets.gen.dart';
import 'package:lumiere_note_sp/presentation/navigation/app_router.gr.dart';
import 'package:lumiere_note_sp/presentation/navigation/navigation_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final List<Trip> tripList = [
      Trip(id: "001", name: "First Trip"),
      Trip(id: "002", name: "Second Trip"),
    ];
    final navigator = ref.watch(navigationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Trip List Recommendation'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pushNamed('/add_trip');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                ),
                SizedBox(width: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Welcome to my app',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Recommendation ${index + 1}'),
                  subtitle: Text('This is a recommended trip.'),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'My Trip List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: tripList.length,
              itemBuilder: (BuildContext context, int index) {
                final trip = tripList[index];
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('${trip.id}'),
                  subtitle: Text('${trip.name}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // ref.read(editTripProvider).state = trip;
                          navigator.push(route: EditTripPageRoute(tripId: 1));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // ref.read(tripListProvider).state.removeAt(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // ref.read(tripListProvider).state = [];
              },
              child: Text('Delete All Trips'),
            ),
          ),
        ],
      ),
    );
  }
}
