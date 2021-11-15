// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Effectively, each super parameters, super.p:
/// ...
/// Implicitly infers its type and default value, if not specified, if
/// applicable, from the associated super-constructor parameter that they are
/// forwarded to.
///
/// @description Check that super parameter implicitly infers its type from the
/// associated super-constructor parameter that they are forwarded to.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

import "../../Utils/expect.dart";

class S {
  num s;
  S([this.s = 3.14]);
}

class C extends S {
  int c;
  C(this.c, [super.s, int x]);
}

main() {
  Expect.equals(3.14, C(1).s);
}

