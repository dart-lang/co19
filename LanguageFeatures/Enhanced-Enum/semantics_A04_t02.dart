// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If no toString member was declared, add
/// String toString() => “Name.${_$name}”;.
///
/// @description Check that if 'toString' member specified, then it is called
/// instead of the default one
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2,
  e3;

  String toString() => "Enum E1.${this.name}";
}

enum E2<T> {
  e1<int>(42),
  e2<String>("Lily was here"),
  e3<bool>(false);

  final T _t;

  const E2(this._t);

  String toString() => "E2<$T>.${this.name}($_t)";
}

main() {
  Expect.equals("Enum E1.e1", E1.e1.toString());
  Expect.equals("Enum E1.e2", E1.e2.toString());
  Expect.equals("Enum E1.e3", E1.e3.toString());
  Expect.equals("E2<int>.e1(42)", E2.e1.toString());
  Expect.equals("E2<String>.e2(Lily was here)", E2.e2.toString());
  Expect.equals("E2<bool>.e3(false)", E2.e3.toString());
}
