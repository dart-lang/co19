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
/// arguments to [C].
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C<T> {
  static int called = 0;

  C() {}

  C.constr(expected) {
    Expect.equals(expected, T);
    called++;
  }
}

main() {
  var v1 = C.constr;
  C c1 = v1(dynamic);
  Expect.equals(1, c1.called);

  var v2 = C<dynamic>.constr;
  C c2 = v2(dynamic);
  Expect.equals(2, c2.called);

  var v3 = (C<dynamic>).constr;
  C c3 = v3(dynamic);
  Expect.equals(3, c3.called);

  var v4 = (C<int>).constr;
  C<int> c4 = v4(int);
  Expect.equals(4, c4.called);

  var v5 = (C<num>).constr;
  C c5 = v5<int>(int);
  Expect.equals(5, c5.called);
}
