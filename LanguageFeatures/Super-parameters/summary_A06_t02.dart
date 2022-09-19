// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Effectively, each super parameters, super.p:
/// ...
/// But can always be named.
///
/// @description Check that super parameter always can be named
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {
  num s1, s2, s3, s4;
  S(this.s1, num x, {this.s3 = 3.14, this.s4 = 0}) : this.s2 = x;
}

class C extends S {
  int c;
  C(int x, {super.s3, super.s4}) : this.c = x + 1, super(42, -1);
}

main() {
  var c = C(1, s3: -3, s4: 4);
  Expect.equals(42, c.s1);
  Expect.equals(-1, c.s2);
  Expect.equals(-3, c.s3);
  Expect.equals(4, c.s4);
}
