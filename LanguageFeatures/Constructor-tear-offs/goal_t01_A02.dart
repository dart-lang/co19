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
/// @description Checks that [v3], [v4] and [v5] are allowed and equivalent
/// constructions
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C<T> {
  C.constr1(int i) {}
}

main() {
  var v1 = C.constr1;
  var v2 = (C.constr1);
  var v3 = (C.constr1<dynamic>);
  var v4 = (C.constr1)<dynamic>;
  Expect.equals(v1, v2);
  Expect.equals(v1, v3);
  Expect.equals(v1, v4);

  var v5 = C.constr1<String>;
  var v6 = (C.constr1<String>);
  var v7 = (C.constr1)<String>;
  Expect.equals(v5, v6);
  Expect.equals(v5, v7);

  Expect.notEquals(v1, v5);
}
