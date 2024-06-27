import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'widgets/crossword_generator_app.dart';
import 'widgets/crossword_puzzle_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        //title: 'Cantuario2 Crossword Builder',
        title: 'Cantuario2 Crossword Puzzle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        //home: const CrosswordGeneratorApp(),
        home: const CrosswordPuzzleApp(),
      ),
    ),
  );
}
