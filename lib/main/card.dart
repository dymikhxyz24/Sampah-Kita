import 'package:flutter/material.dart';

class PrettyCard extends StatelessWidget {
  final String name;
  final bool isSelected;
  final void Function()? onDelete;
  final void Function()? onTap;
  final List trashCan;

  const PrettyCard(
      {Key? key,
      required this.name,
      required this.isSelected,
      this.onDelete,
      this.onTap,
      required this.trashCan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        // surfaceTintColor: isSelected ? Colors.black : null,
        // color: Colors.cyan.shade900,
        children: [
          ListTile(
            dense: true,
            selected: isSelected,
            onTap: trashCan.isNotEmpty ? onDelete : onTap,
            onLongPress: onDelete,
            tileColor: Colors.cyan.shade900,
            selectedColor: Colors.white,
            selectedTileColor: Colors.cyan.shade900,
            title: Text(name),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.cyan.shade50,
                    width: 3,
                    style: isSelected ? BorderStyle.solid : BorderStyle.none)),
          ),
        ],
      ),
    );
  }
}
