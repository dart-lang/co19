// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] is not generic, then [<typeParams>] and [<typeArgs>] are
/// omitted. Otherwise <typeParams> are exactly the same type parameters as
/// those of the class declaration of [C] (including bounds), and [<typeArgs>]
/// applies those type parameter variables directly as type arguments to [C].
///
/// @description Checks that for generic class <typeParams> are exactly the same
/// type parameters as those of the class declaration of [C] (including bounds),
/// and [<typeArgs>] applies those type parameter variables directly as type
/// arguments to [C] - test case with the several type parameters.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C<T1, T2 extends num, T3 extends String> {
  int called = 0;

  C() {}

  C.constr(exp1, exp2, exp3) {
    Expect.equals(exp1, T1);
    Expect.equals(exp2, T2);
    Expect.equals(exp3, T3);
    called++;
  }
}

main() {
  var v1 = C.constr;
  C c1 = v1(dynamic, num, String);
  Expect.equals(1, c1.called);

  var v2 = C<dynamic, num, String>.constr;
  C c2 = v2(dynamic, num, String);
  Expect.equals(1, c2.called);

  var v3 = C<dynamic, int, String>.constr;
  C c3 = v3(dynamic, int, String);
  Expect.equals(1, c3.called);
}
