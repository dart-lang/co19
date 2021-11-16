// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Effectively, each super parameters, super.p:
/// ...
/// But can always be named.
///
/// @description Check that super parameter always can be named
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

import "../../Utils/expect.dart";

class S {
  num s1, s2;
  S(this.s1, {this.s2 = 3.14});
}

class C extends S {
  int c;
  C(int x, {super.s2}) : this.c = x + 1, super(42);
}

main() {
  var c = C(1, s2: -1);
  Expect.equals(-1, c.s2);
  Expect.equals(42, c.s1);
}
