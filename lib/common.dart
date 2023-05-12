// Module for common custom widgets shared across different modules

import 'package:flutter/material.dart';

class StringListField extends StatefulWidget {
  final String title;
  final List<String> items;

  StringListField({required this.title, required this.items});

  @override
  _StringListFieldState createState() => _StringListFieldState();
}

class _StringListFieldState extends State<StringListField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return ListTile(
                title: TextField(
                  controller: TextEditingController(text: item),
                  onChanged: (value) => widget.items[index] = value,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.items.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                widget.items.add('');
              });
            },
          ),
        ],
      ),
    );
  }
}
