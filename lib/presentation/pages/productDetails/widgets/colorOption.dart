import 'package:flutter/material.dart';

/// details color option
class DetailsColorOption extends StatefulWidget {
  /// on color selected
  final Function(String color) onColorSelected;

  ///constructor
  const DetailsColorOption({super.key, required this.onColorSelected});

  @override
  State<DetailsColorOption> createState() => _DetailsColorOptionState();
}

class _DetailsColorOptionState extends State<DetailsColorOption> {
  List<String> colors = ['Red', 'Green', 'Blue'];
  String selectedColor = '';
  Color _getcolor(String color) {
    if(color=='Red'){
      return Colors.red;
    }else if(color=='Green'){
      return Colors.green;
    }else if(color=='Blue'){
      return Colors.blue;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {
            widget.onColorSelected(color);
            setState(() {
              selectedColor = color;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getcolor(color),
              
              border: Border.all(color: selectedColor == color ? Colors.transparent : Colors.white,
              width: 3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(color, style: const TextStyle(color: Colors.white)),
          ),
        );
      }).toList(),
    );
  }
}
