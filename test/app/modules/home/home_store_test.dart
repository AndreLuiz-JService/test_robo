import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:teste_robo/app/modules/home/home_store.dart';
import 'package:teste_robo/app/modules/home/models/robo_model.dart';
import 'dart:io';

void main() {
  test(
    'O valor da grid deve ser igual o valor fornecido',
    () {
      final homeStore = HomeStore();
      homeStore.setGrid(position: const Offset(5, 5));
      expect(const Offset(5, 5), homeStore.grid);
    },
  );


  test('o robo 1 deve para em 1 3 N e o robo 2 deve parar em 5 1 L', () {
    final homeStore = HomeStore();

    homeStore.setGrid(position: Offset(5, 5));

    homeStore.addRobo(
      position: const Offset(1, 2),
      direction: Direction.N,
      instruction: 'EMEMEMEMM',
    );

    homeStore.addRobo(
      position: const Offset(3, 3),
      direction: Direction.L,
      instruction: 'MMDMMDMDDM',
    );

    homeStore.moverRobos();
    final robo1 = homeStore.robos[0];
    final robo2 = homeStore.robos[1];

    expect(const Offset(1, 3), robo1.position);
    expect(Direction.N, robo1.direction);

    expect(const Offset(5, 1), robo2.position);
    expect(Direction.L, robo2.direction);
  });
}
