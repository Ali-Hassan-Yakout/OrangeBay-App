import 'package:flutter/material.dart';

class CurrencyDropDown extends StatefulWidget {
  const CurrencyDropDown({Key? key}) : super(key: key);

  @override
  State<CurrencyDropDown> createState() => _CurrencyDropDownState();
}

class _CurrencyDropDownState extends State<CurrencyDropDown> {
   String? _selectedItem;

  // List of items for the dropdown
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        alignment: Alignment.centerRight,
        borderRadius: BorderRadius.circular(6),
        hint: const Text('العمله'),
        value: _selectedItem,
        onChanged: (String? value) {
          setState(() {
            _selectedItem = value;
          });
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
