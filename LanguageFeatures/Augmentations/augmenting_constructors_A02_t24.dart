// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// ...
/// It is a compile-time error if:
/// - The signature of an augmenting constructor does not match the signature of
///   the corresponding introductory declaration.
///
/// @description Checks that a constructor with private named parameters can be
/// augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C1 {
  int _p;
  C1({this._p});
}

augment class C1 {
  augment C1({int p = 0});
}

class C2 {
  int _p;
  C2({int p});
}

augment class C2 {
  augment C2({this._p = 0});
}

enum E1 {
  e0;

  final int _p;
  const E1({this._p});
}

augment enum E1 {
  ;
  augment const E1({int p = 0});
}

enum E2 {
  e0;

  final int _p;
  const E2({int p});
}

augment enum E2 {
  ;
  augment const E2({this._p = 0});
}

extension type ET1(int _p) {
  ET1.foo({this._p});
}

augment extension type ET1 {
  augment ET1.foo({int p = 0});
}

extension type ET2(int _p) {
  ET2.foo({int p});
}

augment extension type ET2 {
  augment ET2.foo({this._p = 0});
}

main() {
  Expect.equals(0, C1()._p);
  Expect.equals(0, C2()._p);
  Expect.equals(0, E1.e0._p);
  Expect.equals(0, E2.e0._p);
  Expect.equals(0, ET1.foo()._p);
  Expect.equals(0, ET2.foo()._p);
}
