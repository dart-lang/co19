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
/// a declaring in-body constructor that has one optional declaring parameter
/// and also non-declaring ones.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

extension type ET1 {
  const this(final int x, int y, [String z = ""]);
}

extension type ET2 {
  const this.someName(int x, {String y = "", final int z = 0});
}

extension type ET3 {
  const this(int x, [String y = "", final int z = 0]);
}

extension type ET4 {
  this.someName(int x, {required final String z});
}

main() {
  Expect.equals("3", ET1(1, 2, "3").z);
  Expect.equals("", ET1(1, 2).z);
  Expect.equals(3, ET2.someName(1, "2", 3).z);
  Expect.equals(0, ET2.someName(1, "2").z);
  Expect.equals(0, ET3(1).z);
  Expect.equals(3, ET3(1, "2", 3).z);
  Expect.equals("2", ET4.someName(1, "2").z);
}
