import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class PhotoState {
  String url;
  bool selected;
  bool display;
  Set<String> tags;

  PhotoState({
    required this.url,
    this.selected = false,
    this.display = true,
    required this.tags,
  });
}

const urls = [
  'https://th.bing.com/th/id/OIP.MPUscXSAaYFkP6xqB6sl4AHaE7?w=247&h=180&c=7&r=0&o=5&pid=1.7',
  'https://th.bing.com/th?id=OIP.RebU7PltPDE7_2EeFsSzCAHaI5&w=228&h=273&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  'https://th.bing.com/th?id=OIP.5D305Qc8oDudBPLkfoV8YgHaDt&w=350&h=175&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  'https://th.bing.com/th?id=OIP.jWZ0H_GTbVjZEmnHD-UGbgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
];

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isTagging = false;

  List<PhotoState> photoStates = List.of(urls.map((e) => PhotoState(url: e, tags: {})));
  Set<String> tags = {"all", "nature", "cat"};

  void toggleTagging(String? url) {
    setState(() {
      isTagging = !isTagging;
      for (var photoState in photoStates) {
        if (photoState.url == url && isTagging) {
          photoState.selected = true;
        } else {
          photoState.selected = false;
        }
      }
    });
  }

  void onPhotoSelect(String url, bool? selected) {
    setState(() {
      for (var ps in photoStates) {
        if (ps.url == url) {
          ps.selected = selected ?? false;
        }
      }
    });
  }

  void selectTag(String tag) {
    setState(() {
      if (isTagging) {
        if (tag != 'all') {
          for (var ps in photoStates) {
            if (ps.selected) {
              ps.tags.add(tag);
              ps.selected = false; // Deselect after tagging
            }
          }
        }
      } else {
        for (var ps in photoStates) {
          ps.display = tag == 'all' ? true : ps.tags.contains(tag);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful widgets',
      home: GalleryPage(
        title: 'Gallery',
        photoStates: photoStates,
        tags: tags,
        tagging: isTagging,
        toggleTagging: toggleTagging,
        selectTag: selectTag,
        onPhotoSelect: onPhotoSelect,
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  final List<PhotoState> photoStates;
  final String title;
  final Set<String> tags;
  final bool tagging;

  final Function toggleTagging;
  final Function selectTag;
  final Function onPhotoSelect;

  const GalleryPage({
    required this.title,
    required this.tagging,
    required this.tags,
    required this.toggleTagging,
    required this.selectTag,
    required this.onPhotoSelect,
    required this.photoStates,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 2,
        children: List.of(
          photoStates.where((e) => e.display).map((ps) => Photo(
                state: ps,
                selectable: tagging,
                onLongPress: toggleTagging,
                onSelect: onPhotoSelect,
              )),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: List.of(tags.map((e) => ListTile(
                title: Text(e),
                onTap: () {
                  selectTag(e);
                  Navigator.of(context).pop();
                },
              ))),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({super.key, required this.state, required this.selectable, required this.onLongPress, required this.onSelect});
  final PhotoState state;
  final bool selectable;
  final Function onLongPress;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
        child: Image.network(state.url),
        onLongPress: () => onLongPress(state.url),
      ),
    ];

    if (selectable) {
      children.add(Positioned(
        left: 20,
        top: 0,
        child: Theme(
          data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey[200]),
          child: Checkbox(
            onChanged: (value) => onSelect(state.url, value),
            value: state.selected,
          ),
        ),
      ));
    }

    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: Colors.black,
      child: Stack(
        children: children,
      ),
    );
  }
}
