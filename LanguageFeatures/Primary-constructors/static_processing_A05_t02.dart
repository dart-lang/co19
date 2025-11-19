// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors). This declaration is treated as
/// a class, mixin class, enum, respectively extension type declaration without
/// a primary constructor which is obtained as described in the following. This
/// determines the dynamic semantics of a primary constructor.
/// ...
/// If `D` is an extension type, it is a compile-time error if the primary
/// constructor that `D` contains does not have exactly one parameter.
///
/// @description Check that it is not an error if an extension type contains
/// a primary constructor that has exactly one parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

extension type const ET1(final int v);

extension type const ET2({final int v = 0});

// Representation variable below is `final` by default
extension type ET3.someName([int v = 0]);

extension type const ET4._({required int v}); // It is allowed to omit `final` here

main() {
  Expect.equals(1, ET1(1).v);
  Expect.equals(0, ET2().v);
  Expect.equals(2, ET2(v: 2).v);
  Expect.equals(0, ET3.someName().v);
  Expect.equals(3, ET3.someName(3).v);
  Expect.equals(4, ET4._(v: 4).v);
}
