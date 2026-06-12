// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter, parameter type of a setter or type
/// of a field which overrides/implements only one or more setters is inferred
/// to be the parameter type of the combined member signature of said setter in
/// the direct superinterfaces.
///
/// @description Checks that it is a compile-time error if inferred type of an
/// implicit getter is not supertype of the initializer.
/// @author sgrekhov22@gmail.com

mixin class A {
  void set x(String _) {}
}

class C1 extends A {
  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 implements A {
  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  void set x(_) {}
}

class C3 with A {
  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 on A {
  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 implements A {
  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC implements A {
  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  void set x(_) {}
}

enum E1 implements A {
  e0;

  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  void set x(_) {}
}

enum E2 with A {
  e0;

  final x = 1;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(M1);
  print(M2);
  print(MC);
  print(E1);
  print(E2);
}
