import 'package:flutter/material.dart';
import 'package:realm_todo/src/features/home/widgets/block_widget.dart';

import 'Utils/home_utils.dart';
import 'controller/document_data.dart';

class HomeScreen extends StatelessWidget {
  final Document document;

  const HomeScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var record = ('m', named: 'v', 'y', named2: 'x', 'z');
    // print(record.runtimeType); // prints y
    // print(record.$1); // prints y

    // print(record.$2);
    // final metadataRecord = document.metadata; // Add this line.
    final (
      title,
      :modified,
    ) = document.metadata; // Modify
    final blocks = document.getBlocks(); // Add this line
    final formattedModifiedDate =
        HomeUtils.formatDate(modified); // Add this line

    return Scaffold(
      appBar: AppBar(
        title: Text(title
            // metadataRecord.$1

            ),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last modified: $formattedModifiedDate'),
            //  Text(

            //     // 'Last modified ${metadataRecord.modified}'
            //     'Last modified  at $modified'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
