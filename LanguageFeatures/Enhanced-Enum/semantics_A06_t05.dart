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
  e1(1, "2"),
  e2.named(3, "4");

  final String log;
  final int val1;
  final String val2;
  const E1(this.val1, this.val2) : log = "E1()";
  const E1.named(this.val1, this.val2) : log = "E1.named()";
}

enum E2<T1 extends num, T2> {
  e1<int, String>(42, "Lily was here"),
  e2<double, bool>.named(3.14, true);

  final String log;
  final T1 val1;
  final T2 val2;
  const E2(this.val1, this.val2) : log = "E2()";
  const E2.named(this.val1, this.val2) : log = "E2.named()";
}

main() {
  Expect.equals("E1()", E1.e1.log);
  Expect.equals("E1.named()", E1.e2.log);
  Expect.equals("E2()", E2.e1.log);
  Expect.equals("E2.named()", E2.e2.log);
  Expect.equals(1, E1.e1.val1);
  Expect.equals("2", E1.e1.val2);
  Expect.equals(3, E1.e2.val1);
  Expect.equals("4", E1.e2.val2);
  Expect.equals(42, E2.e1.val1);
  Expect.equals("Lily was here", E2.e1.val2);
  Expect.equals(3.14, E2.e2.val1);
  Expect.equals(true, E2.e2.val2);
}
