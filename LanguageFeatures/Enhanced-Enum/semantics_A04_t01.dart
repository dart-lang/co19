// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
/// ...
/// Declared members: For each member declaration of the enum declaration E, the
/// same member is added to the class C. This includes constructors (which must
/// be const generative or non-const factory constructors.)
///
/// @description Check that all members of the `enum` declaration are added to
/// class `C`
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E {
  e1,
  e2,
  e3;

  final int i = 42;
  String get getter => "getter";
  void set setter(int i) {}
  int method() => 314;
}

main() {
  Expect.equals(42, E.e1.i);
  Expect.equals("getter", E.e1.getter);
  E.e1.setter = 42;
  Expect.equals(314, E.e1.method());
  Expect.equals(42, E.e2.i);
  Expect.equals("getter", E.e2.getter);
  E.e2.setter = 42;
  Expect.equals(314, E.e2.method());
  Expect.equals(42, E.e3.i);
  Expect.equals("getter", E.e3.getter);
  E.e3.setter = 42;
  Expect.equals(314, E.e3.method());
}
