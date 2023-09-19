import 'package:moniepoint_task/main.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final Color? bg;
  final Color? ec;
  final List<String>? elemTags;
  final List<IconData>? icons;
  final int? current;
  final Function(int)? onPressed;

  const CustomNavigationBar(
      {Key? key,
      this.bg,
      this.ec,
      this.elemTags,
      this.icons,
      this.current,
      this.onPressed})
      : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  Color get bg => widget.bg!;
  Color get ec => widget.ec!;
  List<String> get elemTags => widget.elemTags!;
  List<IconData> get icons => widget.icons!;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _getChildren(),
      ),
    );
  }

  List<Widget> _getChildren() {
    List<Widget> ret = [];
    for (int i = 0; i < elemTags.length; i++) {
      ret.add(
        Expanded(
          child: NavigationBarElement(
            tag: elemTags[i],
            icon: icons[i],
            press: widget.onPressed!,
            position: i,
            opened: widget.current == i,
            color: ec,
          ),
        ),
      );
    }
    return ret;
  }
}

class NavigationBarElement extends StatefulWidget {
  final String tag;
  final IconData icon;
  final Color color;
  final int position;
  final bool opened;
  final Function(int) press;

  const NavigationBarElement({
    Key? key,
    required this.tag,
    required this.icon,
    required this.press,
    required this.position,
    required this.opened,
    required this.color,
  }) : super(key: key);

  @override
  _NavigationBarElementState createState() => _NavigationBarElementState();
}

class _NavigationBarElementState extends State<NavigationBarElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press(widget.position);
      },
      child: SizedBox(
        height: 75,
        child: Stack(
          children: [
            AnimatedPositioned(
              right: 0,
              left: 0,
              top: widget.opened ? -50 : 0,
              bottom: 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: widget.opened ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  widget.icon,
                  color: Colors.grey,
                ),
              ),
            ),
            AnimatedPositioned(
              right: 0,
              left: 0,
              bottom: widget.opened ? 0 : -50,
              top: 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: widget.opened ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color:
                          widget.opened ? context.primaryColor() : Colors.grey,
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
