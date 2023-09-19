import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List Screen'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation, index);
        },
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(item),
      ),
    );
  }
}
