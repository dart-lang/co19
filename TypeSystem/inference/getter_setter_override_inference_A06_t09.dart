// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The type of a non-final field which overrides both a setter and a
/// getter is inferred to be the parameter type of the combined member signature
/// of said setter in the direct superinterfaces, if this type is the same as
/// the return type of the combined member signature of said getter in the
/// direct superinterfaces. If the types are not the same then inference fails
/// with an error.
///
/// @description Check that it is a compile-time error if combined member
/// signature of getter and setter in the direct superinterfaces are not the
/// same. Test implicit getters.
/// @author sgrekhov22@gmail.com

class A {
  void set m1(num _) {}
  final num m1 = 0;
  void set m2(int _) {}
  final int m2 = 42;
}

class B {
  void set m1(int _) {}
  final int m1 = 0;
  void set m2(num _) {}
  final num m2 = 42;
}

class C implements A, B {
  // combined signature of the setter m1 in A and B is m1(num)
  // combined signature of the getter m1 in A and B is int
  var m1 = 0;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  var m2 = 0;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC implements A, B {
  var m1 = 0;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  var m2 = 0;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M on A, B {
  var m1 = 0;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  var m2 = 0;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(MC);
  print(M);
}
