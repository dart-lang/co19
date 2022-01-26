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
/// @description Check that it is a compile-time error if args are not
/// compile-time constants
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

int x = 1;
String y = "s";
double z = 3.14;

enum E1 {
  e1(x, "2"),
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e2.named(3, y);
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  final int val1;
  final String val2;
  const E1(this.val1, this.val2);
  const E1.named(this.val1, this.val2);
}

enum E2<T1 extends num, T2> {
  e1<int, String>(x, "Lily was here"),
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  e2<double, bool>.named(z, true);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  final T1 val1;
  final T2 val2;
  const E2(this.val1, this.val2);
  const E2.named(this.val1, this.val2);
}

main() {
  print(E1.e1);
  print(E2.e1);
}
