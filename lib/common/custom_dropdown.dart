import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  String? defaultItem ;
  final Function(String?) onUpdateValue;
  CustomDropDown({
    Key? key,
    required this.items,
    required this.defaultItem,
    required this.onUpdateValue,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.defaultItem,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
    
      )),
        items: widget.items
            .map((item) => DropdownMenuItem(
                  child: Text(item),
                  value: item,
                ))
            .toList(),
        onChanged: (String? newVal) {
          setState(() {
          widget.defaultItem = newVal;
          widget.onUpdateValue(newVal);
          });
        });
  }
}
