import 'package:dashboard/const/constants.dart';
import 'package:dashboard/data/menu_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 70),
      child: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: selectedIndex == index
                  ? selectionColor
                  : Colors.transparent,
            ),
            duration: Duration(milliseconds: 250),
            child: InkWell(
              onTap: () => setState(() {
                selectedIndex = index;
              }),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    Icon(
                      menuList[index].icon,
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.grey,
                    ),
                    Text(
                      menuList[index].title,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.grey,
                        fontWeight: selectedIndex == index
                            ? FontWeight.w800
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
