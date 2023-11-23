// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When tearing off a constructor of a generic class using [C.name],
/// the type arguments may be implicitly instantiated, just as for a normal
/// generic method tear-off of the corresponding static function. The
/// instantiation is based on the context-type at the tear-off position. If the
/// context types allows a generic function, the tear-off is not instantiated
/// and the result is a generic function.
///
/// @description Checks that type arguments can be instantiated during the
/// constructor tearing off.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C<T1, T2 extends num, T3 extends String> {
  var t1, t2, t3;
  var p1, p2;

  C.constr() {
    t1 = T1;
    t2 = T2;
    t3 = T3;
  }
  C.constr1(T1 par1, T2 par2) {
    t1 = T1;
    t2 = T2;
    t3 = T3;
    p1 = par1;
    p2 = par2;
  }

  void check(exp1, exp2, exp3, exp4, exp5) {
    Expect.equals(exp1, T1);
    Expect.equals(exp2, T2);
    Expect.equals(exp3, T3);
    if (p1 is List) {
      Expect.listEquals(exp4, p1);
    } else {
      Expect.equals(exp4, p1);
    }
    Expect.equals(exp5, p2);
  }
}

main() {
  var v1 = C<dynamic, num, String>.constr;
  C c1 = v1();
  c1.check(dynamic, num, String, null, null);

  var v2 = C<dynamic, num, String>.constr1;
  C c2 = v2([], 0);
  c2.check(dynamic, num, String, [], 0);

  var v3 = C<List, int, String>.constr;
  C c3 = v3();
  c3.check(List, int, String, null, null);

  var v4 = C<List, int, String>.constr1;
  C c4 = v4([], 0);
  c4.check(List, int, String, [], 0);
}
