import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_robo/app/modules/home/models/robo_model.dart';

void main() {
  final robo = Robo(
      direction: Direction.N,
      position: Offset(1, 2),
      instruction: 'EMMEMEMEMM',
      name: '1');
  test(
    'a posição do robo deve ser 1,3',
    () {
      robo.move(limitPosition: const Offset(5, 5));
      expect(Offset(1, 3), robo.position);
      expect(Direction.N, robo.direction);
    },
  );
}
