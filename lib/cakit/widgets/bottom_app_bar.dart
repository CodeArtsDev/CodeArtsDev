import './text.dart';
import 'package:flutter/material.dart';

class CaBottomAppBarItem {
  final IconData icon;
  final String label;
  final Widget widget;

  CaBottomAppBarItem(this.icon, this.label, this.widget);
}

class CaBottomAppBarScreen extends StatefulWidget {
  final List<CaBottomAppBarItem> items;

  CaBottomAppBarScreen({Key? key, required this.items}) : super(key: key);

  @override
  _CaBottomAppBarScreenState createState() => _CaBottomAppBarScreenState();
}

class _CaBottomAppBarScreenState extends State<CaBottomAppBarScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomAppBar(theme),
    );
  }

  Widget _buildBody() {
    return widget.items[_currentIndex].widget;
  }

  Widget _buildBottomAppBar(ThemeData theme) {
    return BottomAppBar(
      elevation: 10,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        for (int i = 0; i < widget.items.length; i++)
          _bottomAppBarItem(i, widget.items[i], theme)
      ]),
    );
  }

  Widget _bottomAppBarItem(
      int index, CaBottomAppBarItem item, ThemeData theme) {
    var color = index == _currentIndex ? theme.primaryColor : Colors.black;

    return InkWell(
      onTap: () => _onAppBarItemTap(index),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              size: 22,
              color: color,
            ),
            SizedBox(
              height: 4,
            ),
            CaText.caption(
              item.label,
              color: color,
            )
          ],
        ),
      ),
    );
  }

  _onAppBarItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
