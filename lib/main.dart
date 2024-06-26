import 'package:flutter/material.dart';
import 'package:flutter_architecture_implementation/random_images_api/random_images_model.dart';
import 'package:flutter_architecture_implementation/random_images_api/random_images_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_implementation/api_service.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = RandomImagesParams();
    // params.rating = 'safe';
    final randomImageRepo = ref.watch(randomImageProvider(params: params));
    // final secondParams = RandomImagesParams();
    // secondParams.rating = 'explicit';
    // log((params == secondParams).toString());
    // final secondRandomImageRepo = ref.watch(randomImageProvider(params: secondParams));
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.invalidate(randomImageProvider);
          },
          child: const Icon(Icons.refresh),
        ),
        body: Column(
          children: [
            Expanded(
              child: randomImageRepo.displayWidget(
                  (data) => Image.network(data.items![0].imageUrl!)),
            ),
            Expanded(
              child: randomImageRepo.displayWidget(
                  (data) => Image.network(data.items![0].imageUrl!)),
            ),
          ],
        ),
      ),
    );
  }
}

final dataProvider = FutureProvider<RandomImageModel>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchData<RandomImageModel>(
    url: 'https://api.nekosapi.com/v3/images/random?limit=1',
    fromJson: (json) => RandomImageModel.fromJson(json),
  );
});
