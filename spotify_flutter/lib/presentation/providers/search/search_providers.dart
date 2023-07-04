import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';
import 'package:spotify_flutter/presentation/providers/mock_data_provider.dart';

final searchCategoryProvider =
    StateNotifierProvider<MockSearchCategoriesNotifier, List<SearchCategory>>(
        (ref) {
  final fetchCategories = ref.read(mockRepositoryProvider).getSearchCategories;

  return MockSearchCategoriesNotifier(fetchSearchCategories: fetchCategories);
});

typedef SearchCategoriesCallback = Future<List<SearchCategory>> Function();

class MockSearchCategoriesNotifier extends StateNotifier<List<SearchCategory>> {
  bool isLoading = false;
  SearchCategoriesCallback fetchSearchCategories;

  MockSearchCategoriesNotifier({
    required this.fetchSearchCategories,
  }) : super([]);

  Future<void> loadItems() async {
    if (isLoading) return;

    isLoading = true;

    final List<SearchCategory> categories = await fetchSearchCategories();
    state = categories;
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading = false;
  }
}
