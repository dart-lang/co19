// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Declare a class with the same name and type parameters as the
/// enum declaration.
///
/// Add extends Enum.
///
/// Further add the mixins and interfaces of the enum declaration.
///
/// @description Check that Enum and other interfaces are implemented
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

class I1 {
}

abstract class I2 {
}

mixin M on Object {
  int mixedInMethod() => 42;
}

enum E<T> with M implements I1, I2 {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(true);

  const E(T t);
}

main() {
  Expect.isTrue(E.e1 is Enum);
  Expect.isTrue(E.e2 is Enum);
  Expect.isTrue(E.e3 is Enum);
  Expect.isTrue(E.e1 is I1);
  Expect.isTrue(E.e2 is I1);
  Expect.isTrue(E.e3 is I1);
  Expect.isTrue(E.e1 is I2);
  Expect.isTrue(E.e2 is I2);
  Expect.isTrue(E.e3 is I2);
  Expect.isTrue(E.e1 is M);
  Expect.isTrue(E.e2 is M);
  Expect.isTrue(E.e3 is M);
  Expect.isTrue(E.e1 is E<int>);
  Expect.isTrue(E.e2 is E<String>);
  Expect.isTrue(E.e3 is E<bool>);
}
