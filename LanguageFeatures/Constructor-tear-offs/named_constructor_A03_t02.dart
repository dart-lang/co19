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
  v1(dynamic);
  Expect.equals(1, C.called);

  var v2 = C<dynamic>.constr;
  v2(dynamic);
  Expect.equals(2, C.called);

  var v3 = (C<dynamic>).constr;
  v3(dynamic);
  Expect.equals(3, C.called);

  var v3 = (C<int>).constr;
  v3(int);
  Expect.equals(3, C.called);

  var v3 = (C<num>).constr;
  v3<int>(int);
  Expect.equals(3, C.called);
}
