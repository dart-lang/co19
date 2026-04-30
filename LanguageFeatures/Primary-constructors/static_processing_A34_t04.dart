// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An identifier expression denoting a parameter of a constant
/// primary constructor that occurs in the initializer list of the body part of
/// the primary constructor, or in an initializing expression of a non-late
/// instance variable declaration, is potentially constant.
///
/// @description Check that an identifier expression denoting a parameter of a
/// constant primary constructor that occurs in an initializing expression of a
/// non-late instance variable declaration is potentially constant. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class A {
  const A();
}

enum const E1(final A a) {
  e0(A());

  final A b = a;
}

enum const E2(A a) {
  e0(A());

  final A b = a;
}

enum const E3([final A? a]) {
  e0(A());

  final A? b = a;
}

enum const E4([A? a]) {
  e0(A());

  final A? b = a;
}

enum const E5({final A? a}) {
  e0(a: A());

  final A? b = a;
}

enum const E6({A? a}) {
  e0(a: A());

  final A? b = a;
}

enum const E7({required final A a}) {
  e0(a: A());

  final A b = a;
}

enum const E8({required A a}) {
  e0(a: A());

  final A b = a;
}

main() {
  print(E1.e0);
  print(E2.e0);
  print(E3.e0);
  print(E4.e0);
  print(E5.e0);
  print(E6.e0);
  print(E7.e0);
  print(E8.e0);
}
