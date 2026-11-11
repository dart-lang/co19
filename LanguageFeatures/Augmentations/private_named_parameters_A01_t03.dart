// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All corresponding parameter names must be the same in the
/// introductory declaration and all augmentations. When augmenting or being
/// augmented by a declaration with a private named parameter, when we say
/// "name", we mean the declared private name of the parameter, not it's
/// corresponding public name.
///
/// @description Checks that a constructor with a private named parameter can be
/// augmented by a constructor that declares a regular parameter with the same
/// private name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

const meta = 0;

class C1 {
  int _p;
  C1({this._p = 1});
}

augment class C1 {
  /// Adding a doc comment and metadata.
  @meta
  augment C1({int _p});
}

class C2 {
  int _p;
  C2({this._p});
}

augment class C2 {
  augment C2({int _p = 2});
}

class C3 {
  int _p;
  C3({this._p = 3});
}

augment class C3 {
  augment C3({_p});
}

enum E1 {
  e0;

  final int _p;
  E1({this._p = 1});
}

augment enum E1 {
  ;
  @meta
  augment E1({int _p});
}

enum E2 {
  e0;

  final int _p;
  E2({this._p});
}

augment enum E2 {
  ;
  augment E2({int _p = 2});
}

enum E3 {
  e0;

  final int _p;
  E3({this._p = 3});
}

augment enum E3 {
  ;
  augment E3({_p});
}

extension type ET1(int _p) {
  ET1.foo({this._p = 1});
}

augment extension type ET1 {
  @meta
  augment ET1.foo({int _p});
}

extension type ET2(int _p) {
  ET2.foo({this._p});
}

augment extension type ET2 {
  augment ET2.foo({int _p = 2});
}

extension type ET3(int _p) {
  ET3.foo({this._p = 3});
}

augment extension type ET3 {
  augment ET3.foo({_p});
}

main() {
  Expect.equals(1, C1()._p);
  Expect.equals(10, C1(p: 10)._p);
  Expect.equals(2, C2()._p);
  Expect.equals(20, C2(p: 20)._p);
  Expect.equals(3, C3()._p);
  Expect.equals(30, C3(p: 30)._p);
  Expect.equals(1, E1.e0._p);
  Expect.equals(2, E2.e0._p);
  Expect.equals(3, E3.e0._p);
  Expect.equals(1, ET1.foo()._p);
  Expect.equals(10, ET1.foo(p: 10)._p);
  Expect.equals(2, ET2.foo()._p);
  Expect.equals(20, ET2.foo(p: 20)._p);
  Expect.equals(3, ET3.foo()._p);
  Expect.equals(30, ET3.foo(p: 30)._p);
}
