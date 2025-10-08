import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfbc/src/tfbc.dart';

void main() {
  runApp(const ProviderScope(child: TFBC()));
}
