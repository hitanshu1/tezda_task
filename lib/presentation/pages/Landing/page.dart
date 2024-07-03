import 'package:flutter/material.dart';

import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';

///A common page to show current loading status along with version information
class LoadingPage extends StatelessWidget {
  ///Current status to be shown
  final String status;
  ///Constructor
  const LoadingPage({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Widgets.loader(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Txt(
            status,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Txt('Version ${AppInfo.versionName}', color: Colors.grey),
        ),
      ],
    ));
  }
}
