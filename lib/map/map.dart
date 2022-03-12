import 'package:fluent_ui/fluent_ui.dart';

import 'model.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Floor? floorValue;
  Room? roomValue;
  Computer? computerValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Map')),
      children: [
        Row(
          children: [
            Expanded(
              child: InfoLabel(
                label: 'Floor',
                child: Combobox<Floor>(
                  placeholder: const Text('Choose a floor'),
                  isExpanded: true,
                  items: floor
                      .map((e) => ComboboxItem<Floor>(
                            value: e,
                            child: Text(e.getName()),
                          ))
                      .toList(),
                  value: floorValue,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => floorValue = value);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InfoLabel(
                label: 'Room',
                child: floorValue == null
                    ? const TextBox(
                        enabled: false,
                        placeholder: 'First schoose floor',
                      )
                    : Combobox<Room>(
                        placeholder: const Text('Choose a room'),
                        isExpanded: true,
                        items: floorValue!.rooms
                            .map((e) =>
                                ComboboxItem<Room>(value: e, child: Text(e.name)))
                            .toList(),
                        value: roomValue,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => roomValue = value);
                          }
                        },
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InfoLabel(
                label: 'Computer',
                child: roomValue == null
                    ? TextBox(
                        enabled: false,
                        placeholder: floorValue == null
                            ? 'First schoose floor'
                            : 'First schoose room',
                      )
                    : Combobox<Computer>(
                        placeholder: const Text('Choose a computer'),
                        isExpanded: true,
                        items: roomValue!.computers
                            .map((e) => ComboboxItem<Computer>(
                                value: e, child: Text(e.name)))
                            .toList(),
                        value: computerValue,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => computerValue = value);
                          }
                        },
                      ),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<ComboboxItem<Room>> getRooms() {
    for (var element in floor) {
      if (element == floorValue) {
        return element.rooms
            .map((e) => ComboboxItem<Room>(value: e, child: Text(e.name)))
            .toList();
      }
    }
    return [];
  }

  getComputers() {}
}
