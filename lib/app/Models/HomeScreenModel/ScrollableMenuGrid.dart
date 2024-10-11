import 'package:flutter/material.dart';

class ScrollableMenuGrid extends StatelessWidget
{
  final List<MenuItemData> menuItems;

  ScrollableMenuGrid({required this.menuItems});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 200, // Adjust this height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < menuItems.length; i += 3)
            Row(
              children: [
                for (var j = i; j < i + 3 && j < menuItems.length; j++)
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: menuItems[j]. onTap,
                      child: _buildMenuItem(
                        menuItems[j].icon,
                        menuItems[j].label,
                        menuItems[j].color,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, Color color)
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class MenuItemData
{
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  MenuItemData(
      {
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}