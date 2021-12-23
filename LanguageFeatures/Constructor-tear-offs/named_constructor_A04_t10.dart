// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, [params] is almost exactly the same parameter list
/// as the constructor [C.name], with the one exception that initializing
/// formals are represented by normal parameters with the same name and type.
/// All remaining properties of the parameters are the same as for the
/// corresponding constructor parameter, including any default values, and
/// [args] is an argument list passing those parameters to [C.name] directly as
/// they are received.
///
/// @description Checks that initializing formals are represented by normal
/// parameters with the same name and type - test named parameters.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  int i = 0;
  int? j = 0;
  String s = "";

  C.constr(this.i, {this.j, this.s = "default"});

  void check(exp1, exp2, exp3) {
    Expect.equals(exp1, i);
    Expect.equals(exp2, j);
    Expect.equals(exp3, s);
  }
}

main() {
  var v = C.constr;
  Expect.isTrue(v is C Function(int i, {int? j, String s}));
  Expect.runtimeIsType<C Function(int i, {int? j, String s})>(v);

  C c1 = v(1);
  c1.check(1, null, "default");

  C c2 = v(12, j: 90);
  c2.check(12, 90, "default");

  C c3 = v(12, s: "stop");
  c3.check(12, null, "stop");

  C c4 = v(12, s: "", j:90);
  c4.check(12, 90, "");
}
