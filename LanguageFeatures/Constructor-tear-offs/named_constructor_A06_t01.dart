// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When tearing off a constructor of a generic class using
/// [C<typeArgs>.name, the torn off method is always instantiated to the
/// provided type arguments (which must be valid type arguments for the
/// class/corresponding function). It otherwise behaves as an implicitly
/// instantiated function tear-off.
///
/// @description Checks that type arguments correctly instantiated for
/// [C<typeArgs>.name.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C<T1, T2 extends num, T3 extends String> {
  C.constr() {}
  C.constr1(T1 t, T2 t2) {}
}

main() {
  var v1 = C<dynamic, num, String>.constr;
  Expect.isTrue(v1 is C Function());
  Expect.runtimeIsType<C Function()>(v1);

  var v2 = C<dynamic, num, String>.constr1;
  Expect.isTrue(v2 is C Function(dynamic, num));
  Expect.runtimeIsType<C Function(dynamic, num)>(v2);

  var v3 = C<List<int>, int, String>.constr;
  Expect.isTrue(v3 is C Function());
  Expect.runtimeIsType<C Function()>(v3);

  var v4 = C<List<int>, int, String>.constr1;
  Expect.isTrue(v4 is C Function(List<int>, int));
  Expect.runtimeIsType<C Function(List<int>, int)>(v4);
}
