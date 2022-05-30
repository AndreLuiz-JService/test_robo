import 'package:flutter/cupertino.dart';

enum Direction {
  N,
  O,
  S,
  L,
}

class Robo {
  String name;
  Direction direction;
  Offset position;
  String instruction;
  Robo({
    required this.name,
    required this.direction,
    required this.position,
    required this.instruction,
  });

  //switch responsavel por retorna a direção do robo em String
  String getDirection() {
    switch (direction) {
      case Direction.N:
        return 'Norte';
      case Direction.O:
        return 'Oeste';
      case Direction.S:
        return 'Sul';
      case Direction.L:
        return 'Leste';
    }
  }

  String move({required Offset limitPosition}) {
    if ((position.dx > limitPosition.dx || position.dy > limitPosition.dy) ||
        (position.dx < 0 || position.dy < 0)) {
      return 'o robo $name estava fora da pista\n';
    } else {

      //base do texto que sera exibido no console
      String log =
          'o robo $name iniciou em ${position.dx}  ${position.dy} virado para ${getDirection()}\n';

      for (int i = 0; i < instruction.length; i++) {
        String movement = instruction[i].toUpperCase();
        if (movement == 'E') {

          //adiciona a String log o movimento de rotação para esquerda do robo;
          void addLeftMovement() {
            log +=
                'O robo $name virou 90° para esquerda e parou virado para ${getDirection()}\n';
          }

          switch (direction) {
            case Direction.N:
              direction = Direction.O;
              addLeftMovement();
              break;
            case Direction.O:
              direction = Direction.S;
              addLeftMovement();
              break;
            case Direction.S:
              direction = Direction.L;
              addLeftMovement();
              break;
            case Direction.L:
              direction = Direction.N;
              addLeftMovement();
              break;
          }
        } else if (movement == 'D') {

          //adiciona a String log o movimento de rotação para direita do robo;
          void addRightMovement() {
            log +=
                'O robo $name virou 90° para direita e parou virado para ${getDirection()}\n';
          }

          switch (direction) {
            case Direction.N:
              direction = Direction.L;
              addRightMovement();
              break;
            case Direction.O:
              direction = Direction.N;
              addRightMovement();
              break;
            case Direction.S:
              direction = Direction.O;
              addRightMovement();
              break;
            case Direction.L:
              direction = Direction.S;
              addRightMovement();
              break;
          }
        } else {

          //adiciona a String log o movimento bem sucedido do robo;
          void addSuccessMoviment(String position) {
            log +=
                'O robo $name se moveu para $position e esta virado para ${getDirection()}\n';
          }

          //adiciona a String log o movimento mal sucedido do robo;
          void addFailMoviment() {
            log += 'Cuidado o robo $name quase saiu da pista\n';
          }

          switch (direction) {
            case Direction.N:
              if (position.dy == limitPosition.dy) {
                addFailMoviment();
              } else {
                addSuccessMoviment('${position.dx} ${(position.dy) + 1}');
                position = Offset(position.dx, position.dy + 1);
              }
              break;
            case Direction.O:
              if (position.dx == 0) {
                addFailMoviment();
              } else {
                addSuccessMoviment('${(position.dx) - 1} ${(position.dy)}');
                position = Offset(position.dx - 1, position.dy);
              }
              break;
            case Direction.S:
              if (position.dy == 0) {
                addFailMoviment();
              } else {
                addSuccessMoviment('${(position.dx)} ${(position.dy) - 1}');
                position = Offset(position.dx, position.dy - 1);
              }
              break;
            case Direction.L:
              if (position.dx == limitPosition.dx) {
                addFailMoviment();
              } else {
                addSuccessMoviment('${(position.dx) + 1} ${(position.dy)}');
                position = Offset(position.dx + 1, position.dy);
              }
              break;
          }
        }
      }
      return log;
    }
  }
}
