import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Cantuario2 Crossword Builder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        home: const Scaffold(
          body: Center(
            child: Text(
              'Cantuario2 starter pack with Riverpod',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    ),
  );
}
