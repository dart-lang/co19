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
/// factory constructor. Test a class.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

class C1(var int v) {
  factory C1.someName(int v) => C1(v);
}

class const C2.someName(final int v) {
  factory const C2(int v) = C2.someName;
}

main() {
  Expect.equals(1, C1(1).v);
  Expect.equals(2, C2(2).v);
}
