// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When inferring the super-constructor invocation, s, targeting the
/// super constructor D, we include the implicit super-parameters from the
/// constructor parameter list:
///
/// The super-constructor invocation s infers a super-constructor invocation s’
/// such that
///
/// The same constructor is targeted by s’ as by s (same leading super or
/// super.id constructor reference).
///
/// @description Check that the same constructor is targeted by s’ as by s
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {
  int? s1;
  int? s2;
  String log;
  S(this.s1, {this.s2}) : log = "S";
  S.named(this.s1, {this.s2}) : log = "S.named";
}

class C extends S {
  int i1;
  int i2;
  C(this.i1, super.s1, int x, {super.s2}) : this.i2 = x;
}

main() {
  Expect.equals("S", C(1, 2, 3, 4).log);
}
