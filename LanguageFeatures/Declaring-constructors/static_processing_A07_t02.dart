// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a declaring
/// constructor, be it in the header or in the body. Let `p` be a formal
/// parameter of a declaring constructor in a class, enum, or extension type
/// declaration `D` named `C`:
///
/// A compile-time error occurs if `p` contains a term of the form
/// `this.v`, or `super.v` where `v` is an identifier, and `p` has the modifier
/// `covariant`.
///
/// @description Check that it is a compile-time error if a formal parameter of
/// a declaring constructor contains a term of the form `super.v` and has the
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

class C5 extends A {
  String x;
  this(covariant String super.x);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 extends A {
  String x;
  this([covariant super.x = ""]);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7 extends A {
  String x;
  this({covariant String super.x = ""});
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8 extends A {
  String x;
  this({required covariant String super.x});
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
}
