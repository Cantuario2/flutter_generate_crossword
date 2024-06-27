import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'crossword_widget.dart';
import 'crossword_info_widget.dart';

class CrosswordGeneratorApp extends StatelessWidget {
  const CrosswordGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _EagerInitialization(
      child: Scaffold(
        appBar: AppBar(
          actions: [_CrosswordGeneratorMenu()], // Add this line
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          title: const Text('Cantuario2 Crossword Generator'),
        ),
        body: SafeArea(
          child: Consumer(
            // Modify from here
            builder: (context, ref, child) {
              return Stack(
                children: [
                  const Positioned.fill(
                    child: CrosswordWidget(),
                  ),
                  if (ref.watch(showDisplayInfoProvider))
                    const CrosswordInfoWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wordListProvider);
    return child;
  }
}

class _CrosswordGeneratorMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => MenuAnchor(
        menuChildren: [
          for (final entry in CrosswordSize.values)
            MenuItemButton(
              onPressed: () => ref.read(sizeProvider.notifier).setSize(entry),
              leadingIcon: entry == ref.watch(sizeProvider)
                  ? const Icon(Icons.radio_button_checked_outlined)
                  : const Icon(Icons.radio_button_unchecked_outlined),
              child: Text(entry.label),
            ),
          MenuItemButton(
            leadingIcon: ref.watch(showDisplayInfoProvider)
                ? const Icon(Icons.check_box_outlined)
                : const Icon(Icons.check_box_outline_blank_outlined),
            onPressed: () =>
                ref.read(showDisplayInfoProvider.notifier).toggle(),
            child: const Text('Display Info'),
          ),
          for (final count in BackgroundWorkers.values) // Add from here
            MenuItemButton(
              leadingIcon: count == ref.watch(workerCountProvider)
                  ? const Icon(Icons.radio_button_checked_outlined)
                  : const Icon(Icons.radio_button_unchecked_outlined),
              onPressed: () =>
                  ref.read(workerCountProvider.notifier).setCount(count),
              child: Text(count.label), // To here.
            ),
        ],
        builder: (context, controller, child) => IconButton(
          onPressed: () => controller.open(),
          icon: const Icon(Icons.settings),
        ),
      );
}
