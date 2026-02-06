// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Primary constructors is a conciseness feature. It does not
/// provide any new semantics at all. It just allows us to express something
/// which is already possible in Dart, using a less verbose notation.
///
/// @description Check that it is not an error if a mixin class declares a
/// trivial primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

mixin class C1() {
  int id = 1;
}

mixin class C2.named() {
  int id = 2;
}

mixin class const C3() {
  final int id = 3;
}


mixin class const C4.named() {
  final int id = 4;
}

main() {
  Expect.equals(1, C1().id);
  Expect.equals(2, C2.named().id);
  Expect.equals(3, const C3().id);
  Expect.equals(4, const C4.named().id);
}
