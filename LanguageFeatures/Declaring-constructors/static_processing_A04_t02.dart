// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, enum, or extension type declaration `D` with a
/// declaring header constructor, also known as a primary constructor.
/// ...
/// If `D` is an extension type, it is a compile-time error if `D`
/// does not contain a declaring constructor that has exactly one declaring
/// parameter which is `final`.
///
/// @description Check that it is not an error if an extension type contains
/// a declaring constructor that has exactly one optional declaring parameter.
/// Test optional parameters.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

extension type const ET1({final int v = 0});

extension type ET2 {
  this({final int v = 0});
}

// Representation variable below is `final` by default
extension type ET3.someName([int v = 0]);

extension type ET4 {
  this.someName([final int v = 0]);
}

extension type const ET5._({required int v}); // It is allowed to omit `final` here

extension type ET6 {
  this._({required final int v});
}

main() {
  Expect.equals(0, ET1().v);
  Expect.equals(1, ET1(v: 1).v);
  Expect.equals(0, ET2().v);
  Expect.equals(2, ET2(v: 2).v);
  Expect.equals(0, ET3.someName().v);
  Expect.equals(3, ET3.someName(3).v);
  Expect.equals(0, ET4.someName().v);
  Expect.equals(4, ET4.someName(4).v);
  Expect.equals(5, ET5._(v: 5).v);
  Expect.equals(6, ET5._(v: 6).v);
}
