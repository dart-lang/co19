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

class C<T extends num> {
  int? i;

  C() { i = 0; }

  C.constr1(int i) { this.i = 1; }
  C.constr2(int num, String str) { this.i = 2; }
  C.constr3() { i = 3; }
}

main() {
  Expect.equals(0, C.new().i);
  Expect.equals(0, (C.new)().i);
  Expect.equals(0, C<num>.new().i);
  Expect.equals(0, (C<num>.new)().i);
  Expect.equals(0, (C.new)<num>().i);
  Expect.equals(0, C<int>.new().i);
  Expect.equals(0, (C<int>.new)().i);
  Expect.equals(0, (C.new)<int>().i);

  Expect.equals(1, C.constr1(42).i);
  Expect.equals(1, (C.constr1)(42).i);
  Expect.equals(1, C<num>.constr1(42).i);
  Expect.equals(1, (C<num>.constr1)(42).i);
  Expect.equals(1, (C.constr1)<num>(42).i);
  Expect.equals(1, C<int>.constr1(42).i);
  Expect.equals(1, (C<int>.constr1)(42).i);
  Expect.equals(1, (C.constr1)<int>(42).i);

  Expect.equals(2, C.constr2(1, "").i);
  Expect.equals(2, (C.constr2)(1, "").i);
  Expect.equals(2, C<int>.constr2(1, "").i);
  Expect.equals(2, (C<int>.constr2)(1, "").i);
  Expect.equals(2, (C.constr2)<int>(1, "").i);

  Expect.equals(3, C.constr3().i);
  Expect.equals(3, (C.constr3)().i);
  Expect.equals(3, C<int>.constr3().i);
  Expect.equals(3, (C<int>.constr3)().i);
  Expect.equals(3, (C.constr3)<int>().i);
}
