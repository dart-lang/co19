// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, enum, or extension type declaration `D` with a
/// declaring header constructor, also known as a primary constructor).
/// ...
/// A compile-time error occurs if the body of `D` contains a non-redirecting
/// generative constructor, unless `D` is an extension type.
///
/// @description Check that it is not an error if `D` is an extension type and
/// the body of `D` contains a non-redirecting generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

extension type ET1(var int v) {
  ET1.someName(this.v);
}

extension type const ET2.someName(final int v) {
  const ET2(int v) : this.v = v;
}

main() {
  Expect.equals(1, ET1(1).v);
  Expect.equals(2, ET2(2).v);
}
