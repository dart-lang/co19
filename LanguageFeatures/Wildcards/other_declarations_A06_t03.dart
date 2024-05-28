// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is no error or warning to declare an external
/// class/mixin/enum etc variable named `_`.
/// @author sgrekhov22@gmail.com
/// @issue 55848

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class C1 {
  external int _;
}

class C2 {
  external static int _;
}

mixin M1 {
  external int _;
}

mixin M2 {
  external static int _;
}

enum E1 {
  e0;
  external final int _;
}

enum E2 {
  e0;
  external static int _;
}

class A {}

extension Ext1 on A {
   external int _;
}

extension Ext2 on A {
  external static int _;
}

extension type ET1(int id) {
  external int _;
}

extension type ET2(int id) {
  external static int _;
}

class MA1 = Object with M1;

main() {
  Expect.throws(() {C1()._;});
  Expect.throws(() {C2._;});
  Expect.throws(() {MA1()._;});
  Expect.throws(() {M2._;});
  Expect.throws(() {E1.e0._;});
  Expect.throws(() {E2._;});
  Expect.throws(() {A()._;});
  Expect.throws(() {Ext2._;});
  Expect.throws(() {ET1(1)._;});
  Expect.throws(() {ET2._;});
}
