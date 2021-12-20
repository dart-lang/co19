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
/// @description Checks that [params] is exactly the same parameter list.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  C.constr1() {}
  C.constr2(int i) {}
  C.constr3(i) {}
  C.constr4(int i, String j, List<int> l) {}
  C.constr5(i, j, k) {}
}

main() {
  C Function() v1 = C.constr1;
  Expect.isTrue(v1 is C Function());
  checkType(checkIs<C Function()>, true, v1);
  v1();

  var v2 = C.constr2;
  Expect.isTrue(v2 is C Function(int));
  checkType(checkIs<C Function(int)>, true, v2);
  v2(14);

  var v3 = C.constr3;
  Expect.isTrue(v3 is C Function(dynamic));
  checkType(checkIs<C Function(dynamic)>, true, v3);
  v3(0);
  v3(null);

  var v4 = C.constr4;
  Expect.isTrue(v4 is C Function(int, String, List<int>));
  checkType(checkIs<C Function(int, String, List<int>)>, true, v4);
  v4(1, "123", [1, 2, 3]);

  var v5 = C.constr5;
  Expect.isTrue(v5 is C Function(dynamic, dynamic, dynamic));
  checkType(checkIs<C Function(dynamic, dynamic, dynamic)>, true, v5);
  v5(1, "123", [1, 2, 3]);
}
