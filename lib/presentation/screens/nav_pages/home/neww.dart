import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/main.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  final List<String> _items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List Screen'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _buildAnimatedItem(_items[index], index);
        },
      ),
    );
  }

  Widget _buildAnimatedItem(String item, int index) {
    return const AnimatedListCard();
  }
}

class AnimatedListCard extends StatelessWidget {
  const AnimatedListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey _listKey = GlobalKey();
    final a = ListTile(
      key: _listKey,
      title: Container(
        height: 120,
        color: context.primaryColor(),
        margin: const EdgeInsets.all(8.0),
      ).animate().fadeIn(duration: 100.ms).then().slide(
            duration: 200.ms,
            end: const Offset(0, 0),
            begin: const Offset(0, 1),
            curve: Curves.easeInOutCubic,
          ),
    );
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        tween: Tween(
          end: const Offset(0, 0),
          begin: const Offset(0, 1),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          height: 120,
          color: context.primaryColor(),
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
        ),
        builder: (context, obj, child) {
          return Transform.translate(
            offset: obj,
            child: child,
          );
        });
  }
}
