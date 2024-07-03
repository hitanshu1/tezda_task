
import 'package:flutter/material.dart';
/// details size option
class DetailsSizeOption extends StatefulWidget {
/// on size change
  final Function(String size) onSizeChange;
  ///constructor
  const DetailsSizeOption({super.key,required this.onSizeChange});

  @override
  State<DetailsSizeOption> createState() => _DetailsSizeOptionState();
}

class _DetailsSizeOptionState extends State<DetailsSizeOption> {

   List<String> sizes = ['S', 'M', 'L'];
   String selectedSize = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: sizes.map((size) {
        return GestureDetector(
          onTap: () {
            widget.onSizeChange(size);
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedSize == size ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(size, style: const TextStyle(color: Colors.white)),
          ),
        );
      }).toList(),
    );
  }
}
