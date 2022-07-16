import 'package:app/src/utils/app_module_entry.dart';
import 'package:flutter/material.dart';
import 'package:app/app.dart';
import 'package:story_module/module.dart';
import 'package:post_module/post_module.dart';

void main() async {
  final entry = AppModuleEntry();
  entry.addModule(StoryModule());
  entry.addModule(PostModule());
  runApp(ModularApp(entry));
}
