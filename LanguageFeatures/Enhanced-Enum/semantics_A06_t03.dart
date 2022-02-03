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
/// @description Check enum's values name and index.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E1<T1 extends num, T2> {
  e1<int, String>(1, "1"),
  e2<int, int>(2, 3);

  const E1(this.t1, this.t2);

  final T1 t1;
  final T2 t2;
}

main() {
  Expect.equals(1, E1.e1.t1);
  Expect.equals("1", E1.e1.t2);
  Expect.equals(2, E1.e2.t1);
  Expect.equals(3, E1.e2.t2);

  Expect.equals(0, E1.e1.index);
  Expect.equals(1, E1.e2.index);
  Expect.equals("e1", EnumName(E1.e1).name);
  Expect.equals("e2", EnumName(E1.e2).name);
}
