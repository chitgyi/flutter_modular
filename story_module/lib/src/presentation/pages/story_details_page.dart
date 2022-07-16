import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:story_module/src/utils/constants/strings.dart';
import 'package:story_module/src/utils/constants/svg_assets.dart';

class StoryDetailsPage extends StatelessWidget {
  const StoryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Story Details")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SvgPicture.asset(
                SvgAssets.draw,
                package: packageName,
                height: 350,
              ),
              const SizedBox(height: 16),
              Text(
                "Asset SVG Image from $packageName",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
