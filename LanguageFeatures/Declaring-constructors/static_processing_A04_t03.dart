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
/// a declaring constructor that has exactly one declaring parameter which is
/// `final`. Test required parameters.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

// Representation variable of a primary (in-header) constructor is `final` by
// default
extension type ET1(int v);

extension type ET2 {
  this(final int v, int x, [int y = 0]);
}

extension type const ET3.someName(final int v);

extension type ET4 {
  const this.someName(final int v, {int x = 0, required int y});
}

main() {
  Expect.equals(1, ET1(1).v);
  Expect.equals(2, const ET2(2, 3, 4).v);
  Expect.equals(2, const ET2(2, 3).v);
  Expect.equals(3, const ET3(3).v);
  Expect.equals(4, const ET4(4, y: 0).v);
  Expect.equals(4, const ET4(4, x: 1, y: 2).v);
}
