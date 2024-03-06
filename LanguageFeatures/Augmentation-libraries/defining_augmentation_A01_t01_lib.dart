// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Declarations in any augmentation or the main library are visible
/// to all of the others, including private ones.
///
/// @description Checks that declarations in an augmentation are visible in a
/// main library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library augment 'defining_augmentation_A01_t01.dart';

class C1 {
  String get y => "y";
}

mixin M1 {
  String get m => "m";
}

enum E1 {
  e;

  E1 get instance => e;
}

var x1 = 42;

int foo1() => 0;

extension MyList on List {
  String get bar => "bar";
}

extension type MyInt(int id) {}

typedef void Foo1();

typedef C1Alias = C1;

class _C2 {
  String get _y => "_y";
}

mixin _M2 {
  String get _m => "_m";
}

enum _E2 {
  e;

  _E2 get _instance => e;
}

var _x2 = 42;

int _foo2() => 0;

extension _MyList on List {
  String get baz => "_baz";
}

extension type _MyInt(int id2) {}

typedef void _Foo2();

typedef _C2Alias = _C2;
