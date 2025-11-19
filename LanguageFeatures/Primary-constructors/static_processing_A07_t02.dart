// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a primary
/// constructor. Let `p` be a formal parameter of a primary constructor in a
/// class, mixin class, enum, or extension type declaration `D` named `C`:
///
/// A compile-time error occurs if `p` contains a term of the form
/// `this.v`, or `super.v` where `v` is an identifier, and `p` has the modifier
/// `covariant`.
///
/// @description Check that it is a compile-time error if a formal parameter of
/// a primary constructor contains a term of the form `super.v` and has the
/// modifier `covariant`. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class A {
  String x;
  A(this.x);
}

class C1(covariant String super.x) extends A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  String x;
}

class C2([covariant super.x = ""]) extends A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  String x;
}

class C3({covariant String super.x = ""}) extends A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  String x;
}

class C4({required covariant String super.x}) extends A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  String x;
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
