import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';
import 'package:user_list/src/features/user/providers/home_provider.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

void main() {
  test('Test 1: User Service has items', () async {
    final container = createContainer();
    final userService = container.read(userServiceProvider);
    var users = await userService.getUsers();
    expect(users.length, greaterThan(0));
  });

  test('Test 2: User Service remove duplicates', () async {
    final container = createContainer();
    final userService = container.read(userServiceProvider);
    var users = userService.removeDuplicates([
      UserModel(id: "1"),
      UserModel(id: "2"),
      UserModel(id: "1"),
      UserModel(id: "1"),
      UserModel(id: "3"),
      UserModel(id: "3"),
      UserModel(id: "5"),
    ]);
    expect(
      users.map((user) => user.id).toList(),
      equals(
        [
          "1",
          "2",
          "3",
          "5",
        ],
      ),
    );
  });
}
