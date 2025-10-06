// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, enum, or extension type declaration `D` with a
/// declaring header constructor, also known as a primary constructor).
/// ...
/// A compile-time error occurs if the body of `D` contains a non-redirecting
/// generative constructor, unless `D` is an extension type.
///
/// @description Check that it is not an error if the body of `D` contains a
/// factory constructor. Test an enum.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

enum E1(int v) {
  e0(1);

  factory ET1.someName(int v) => E1.e0;
}

enum const E2.someName(final int v) {
  e0(2);

  const factory E2(int v) => E2.e0;
}

main() {
  Expect.equals(1, E1.e0.v);
  Expect.equals(2, E2.e0.v);
}
