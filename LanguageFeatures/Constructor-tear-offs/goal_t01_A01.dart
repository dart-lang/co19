// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The goal is that you can always tear off a constructor, then
/// invoke the torn off function and get the same result as invoking the
/// constructor directly. For a named constructor it means that
///
///  var v1 = C.name(args);
///  var v2 = (C.name)(args);
//
///  // and
///
///  var v3 = C<typeArgs>.name(args);
///  var v4 = (C<typeArgs>.name)(args);
///  var v5 = (C.name)<typeArgs>(args);
///
/// should always give equivalent values for [v1] and [v2], and for [v3], [v4]
/// and [v5].
///
/// @description Checks that [v1] and [v2] are allowed and equivalent
/// constructions.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C {
  C.constr1(int i) {}
  C.constr2(int i) {}
  C.constr3(int i, String s, x) {}
  C.constr4() {}
}

main() {
  var v1 = C.constr1;
  var v2 = (C.constr1);
  Expect.equals(v1, v2);

  var v3 = C.constr2;
  var v4 = (C.constr2);
  Expect.equals(v3, v4);

  var v5 = C.constr1;
  var v6 = (C.constr1);
  Expect.equals(v5, v6);

  var v7 = C.constr4;

  Expect.notEquals(v1, v3);
  Expect.notEquals(v1, v4);
  Expect.notEquals(v1, v5);
  Expect.notEquals(v1, v6);
  Expect.notEquals(v1, v7);

  Expect.notEquals(v2, v3);
  Expect.notEquals(v2, v4);
  Expect.notEquals(v2, v5);
  Expect.notEquals(v2, v6);
  Expect.notEquals(v2, v7);

  Expect.notEquals(v3, v7);
  Expect.notEquals(v4, v7);
  Expect.notEquals(v5, v7);
  Expect.notEquals(v6, v7);
}
