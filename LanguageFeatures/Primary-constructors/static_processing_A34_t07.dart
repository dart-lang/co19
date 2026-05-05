// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An identifier expression denoting a parameter of a constant
/// primary constructor that occurs in the initializer list of the body part of
/// the primary constructor, or in an initializing expression of a non-late
/// instance variable declaration, is potentially constant.
///
/// @description Check that it is a compile-time error if a parameter of a
/// constant primary constructor occurs in an constant initializing expression
/// of a non-late instance variable declaration. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class A {
  const A();
}

class B {
  final A a;
  const B(this.a);
}

class const C1(final A a) {
  final B b = const B(a);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C2(A a) {
  final B b = const B(a);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C3([final A? a]) {
  final B? b = const B(a);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C4([A? a]) {
  final B? b = const B(a);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C5({final A? a}) {
  final B? b = const B(a);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C6({A? a}) {
  final B? b = const B(a);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C7({required final A a}) {
  final B b = const B(a);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C8({required A a}) {
  final B b = const B(a);
//                    ^
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
