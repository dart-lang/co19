// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
/// ...
/// Default constructor: If no generative constructors were declared, and no
/// unnamed factory constructor was added, a default generative constructor is
/// added:
///
/// const Name();
/// (This differs from the default constructor of a normal class declaration by
/// being constant, and by being added even if a factory constructor is present.
/// If no generative constructor is declared, and the unnamed constructor is
/// taken by a factory constructor, there is no way for the enum declaration to
/// compile successfully, since the declaration must contain at least one enum
/// value, and that enum value must refer to a generative constructor.)
///
/// @description Check that if no generative constructors were declared, and no
/// unnamed factory constructor was added, a default generative constructor is
/// added
/// @Issue 48179, 48181
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2,
  e3;

  factory E1.f(int i) => E1.values[i];
}

enum E2 {
  e1(),
  e2(),
  e3();

  final String s = "Lily was here";
  final int? val = null;

  factory E2.f(int i) => E2.values[i];
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
  Expect.equals("Lily was here", E2.e1.s);
  Expect.equals("Lily was here", E2.e2.s);
  Expect.equals("Lily was here", E2.e3.s);
  Expect.isNull(E2.e1.val);
  Expect.isNull(E2.e2.val);
  Expect.isNull(E2.e3.val);

  const EE1 = E1.e1;
  const EE2 = E2.e1;
}
