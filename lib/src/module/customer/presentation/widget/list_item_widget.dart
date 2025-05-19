import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final IconData? iconData;
  final String? name;
  final Function()? onClick;
  const ListItemWidget({
    super.key,
    this.iconData,
    this.name,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      borderOnForeground: false,
      elevation: 0,
      child: ListTile(
        title: Text(name ?? ""),
        trailing: IconButton(onPressed: onClick, icon: Icon(iconData))
      ),
    );
  }
}
