import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_robo/app/modules/home/models/robo_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  Offset _grid = const Offset(5, 5);

  Offset get grid => _grid;

  void setGrid({required Offset position}) {
    _grid = position;
  }

  List<Robo> robos = [];

  void addRobo({
    required Offset position,
    required Direction direction,
    required String instruction,
  }) {
    final robo = Robo(
      direction: direction,
      position: position,
      instruction: instruction,
      name: (robos.length + 1).toString(),
    );
    robos.add(robo);
  }

  void moverRobos() {
    String log = '';
    for (var robo in robos) {
      log += robo.move(limitPosition: _grid);
    }
    debugPrint(log);
  }
}
