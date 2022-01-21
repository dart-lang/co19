// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
/// ...
/// Enum values: For each <enumEntry> with name id and index i in the
/// comma-separated list of enum entries, a constant value is created, and a
/// static constant variable named id is created in C with that value. All the
/// constant values are associated, in some implementation dependent way, with
///
/// their name id as a string "id",
///
/// their index i as an int, and
/// their enum class’s name as a string, "Name",
/// all of which is accessible to the toString and index member of Enum, and to
/// the EnumName.name extension getter. The values are computed as follows.
///
/// id ↦ Name() (no arguments, equivalent to empty argument list)
/// id(args) ↦ Name(args)
/// id<types>(args) ↦ Name<types>(args)
/// id.named(args) ↦ Name._$named(args)
/// id<types>.named(args) ↦ Name<types>._$named(args)
/// where args are considered as occurring in a const context, and it’s a
/// compile-time error if they are then not compile-time constants.
///
/// @description Check that if no generative constructors were declared, and no
/// unnamed factory constructor was added, a default generative constructor is
/// added
/// @Issue 48179, 48181
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

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
