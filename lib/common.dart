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

class TileListField<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final Widget Function(BuildContext, [T?]) dialogBuilder;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(int) onDelete;
  final void Function(int, int) onReorder;

  TileListField({
    required this.title,
    required this.items,
    required this.dialogBuilder,
    required this.itemBuilder,
    void Function(int)? onDelete,
    void Function(int, int)? onReorder,
  })  : onDelete = onDelete ??
            ((index) {
              items.removeAt(index);
            }),
        onReorder = onReorder ??
            ((oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });

  @override
  _TileListFieldState<T> createState() => _TileListFieldState<T>();
}

class _TileListFieldState<T> extends State<TileListField<T>> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                final result = await showDialog<T>(
                  context: context,
                  builder: (context) => widget.dialogBuilder(context),
                );
                if (result != null) {
                  setState(() {
                    widget.items.add(result);
                  });
                }
              },
            ),
          ),
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return ListTile(
                key: ValueKey(item),
                title: widget.itemBuilder(context, item),
                // Edit/Delete menu on leading
                leading: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('Edit'),
                      value: 'edit',
                    ),
                    const PopupMenuItem(
                      child: Text('Delete'),
                      value: 'delete',
                    ),
                  ],
                  onSelected: (value) async {
                    if (value == 'edit') {
                      final result = await showDialog<T>(
                        context: context,
                        builder: (context) =>
                            widget.dialogBuilder(context, item),
                      );
                      if (result != null) {
                        setState(() {
                          widget.items[index] = result;
                        });
                      }
                    } else if (value == 'delete') {
                      setState(() {
                        widget.onDelete(index);
                      });
                    }
                  },
                ),
                onTap: () async {
                  final result = await showDialog<T>(
                    context: context,
                    builder: (context) => widget.dialogBuilder(context, item),
                  );
                  if (result != null) {
                    setState(() {
                      widget.items[index] = result;
                    });
                  }
                },
              );
            },
            onReorder: widget.onReorder,
          ),
        ],
      ),
    );
  }
}
