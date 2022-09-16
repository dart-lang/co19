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
/// @description Checks that [params] is exactly the same parameter list - test
/// incorrect named arguments dynamically.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C {
  int ii = 0;
  int? jj = 0;
  String ss = "";

  C.constr(int i, {int? j, String s = "testme"}) {
    ii = i;
    jj = j;
    ss = s;
  }

  void check(exp1, exp2, exp3) {
    Expect.equals(exp1, ii);
    Expect.equals(exp2, jj);
    Expect.equals(exp3, ss);
  }
}

dynamic d = 1.5;

main() {
  var v = C.constr;

  Expect.throws(() { v(1, j: d); });
  Expect.throws(() { v(1, s: d); });
}
