// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If no generative constructors were declared, and no unnamed
/// factory constructor was added, a default generative constructor
/// const Name._$(this.index, this._$name); is added.
///
/// @description Check the case when enum has no generative constructor
/// specified
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2,
  e3;

  factory E1.f(int index) => values[i];
}

enum E2 {
  e1(),
  e2(),
  e3();

  factory E2.f(int index) => values[i];
}

main() {
  Expect.equals(0, E1.e1.index);
  Expect.equals(1, E1.e2.index);
  Expect.equals(2, E1.e3.index);
  Expect.equals("E1.e1", E1.e1.toString());
  Expect.equals("E1.e2", E1.e2.toString());
  Expect.equals("E1.e3", E1.e3.toString());
  Expect.equals(0, E2.e1.index);
  Expect.equals(1, E2.e2.index);
  Expect.equals(2, E2.e3.index);
  Expect.equals("E2.e1", E2.e1.toString());
  Expect.equals("E2.e2", E2.e2.toString());
  Expect.equals("E2.e3", E2.e3.toString());
}
