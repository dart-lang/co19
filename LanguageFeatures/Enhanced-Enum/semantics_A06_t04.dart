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
/// @description Check computing of enum values
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2(),
  e3.named();

  final String log;
  const E1() : log = "E1()";
  const E1.named() : log = "E1.named()";
}

enum E2<T extends num> {
  e1,
  e2(),
  e3.named(),
  e4<int>(),
  e5<double>.named();

  final String log;
  const E2() : log = "E2()";
  const E2.named() : log = "E2.named()";
}

main() {
  Expect.equals("E1()", E1.e1.log);
  Expect.equals("E1()", E1.e2.log);
  Expect.equals("E1.named()", E1.e3.log);

  Expect.equals("E2()", E2.e1.log);
  Expect.equals("E2()", E2.e2.log);
  Expect.equals("E2.named()", E2.e3.log);
  Expect.equals("E2()", E2.e4.log);
  Expect.equals("E2.named()", E2.e5.log);
}
