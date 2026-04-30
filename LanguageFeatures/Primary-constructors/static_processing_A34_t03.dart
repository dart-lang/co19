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
/// non-late instance variable declaration is potentially constant. Test classes
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class A {
  const A();
}

class const C1(final A a) {
  final A b = a;
}

class const C2(A a) {
  final A b = a;
}

class const C3([final A? a]) {
  final A? b = a;
}

class const C4([A? a]) {
  final A? b = a;
}

class const C5({final A? a}) {
  final A? b = a;
}

class const C6({A? a}) {
  final A? b = a;
}

class const C7({required final A a}) {
  final A b = a;
}

class const C8({required A a}) {
  final A b = a;
}

main() {
  const C1(A());
  const C2(A());
  const C3(A());
  const C4(A());
  const C5(a: A());
  const C6(a: A());
  const C7(a: A());
  const C8(a: A());
}
