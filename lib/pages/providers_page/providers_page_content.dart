import 'package:clean_app/pages/providers_page/test_provider.dart';
import 'package:clean_app/utils/stopwatch_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersPageContent extends StatelessWidget {
  const ProvidersPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (_, TestProvider provider, __) {
        return Container(
          child: Center(
            child: Column(
              children: <Widget>[
                const Text('Naciśnij przycisk aby wyświetlić obecną godzinę'),
                ElevatedButton(
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      StopwatchUtils().stop(key: 'providers_page_content_draw');
                    });
                    StopwatchUtils().start(key: 'providers_page_content_draw');
                    provider.getCurrentDate();
                  },
                  child: const Text('Pokaż godzinę'),
                ),
                Text(provider.dateTime),
              ],
            ),
          ),
        );
      },
    );
  }
}
