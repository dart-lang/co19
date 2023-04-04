// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library containing common classes for exhaustiveness tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,class-modifiers

library exhaustiveness_lib;

enum Suit { club, diamond, heart, spade }

sealed class Card<T> {
  final Suit suit;

  Card(this.suit);
}

class Pip<T> extends Card<T> {
  final int pips;

  Pip(this.pips, super.suit);
}

sealed class Face<T> extends Card<T> {
  Face(super.suit);
}

class Jack<T> extends Face<T> {
  final bool oneEyed;

  Jack(super.suit, {this.oneEyed = false});
}

class Queen<T> extends Face<T> {
  Queen(super.suit);
}

class King<T> extends Face<T> {
  King(super.suit);
}
