import 'dart:math';

import 'package:cuddly_telegram/model/document_store.dart';
import 'package:cuddly_telegram/screens/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileBrowserScreen extends StatefulWidget {
  const FileBrowserScreen({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  _FileBrowserScreenState createState() => _FileBrowserScreenState();
}

class _FileBrowserScreenState extends State<FileBrowserScreen> {
  Widget get body {
    return Consumer<DocumentStore>(
      builder: (context, docStore, child) => GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1 / sqrt(2), // A4 paper
        ),
        itemCount: docStore.count,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.of(context).pushNamed(EditorScreen.routeName);
              },
              child: const Center(
                child: Text("Document"),
              ),
            ),
            color: Colors.yellow.shade100,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}