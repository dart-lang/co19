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
/// @description Checks that type arguments can be implicitly instantiated.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C<T1, T2 extends num, T3 extends String> {
  C.constr() {}
  C.constr1(T1 t, T2 t2) {}
}

main() {
  Expect.isTrue(C.constr is C<T1, T2, T3>
      Function<T1 extends dynamic, T2 extends num, T3 extends String>());
  Expect.runtimeIsType<
      C<T1, T2, T3> Function<T1 extends dynamic, T2 extends num,
          T3 extends String>()>(C.constr);
  Expect.isTrue(C.constr1 is C<T1, T2, T3>
      Function<T1 extends dynamic, T2 extends num, T3 extends String>(T1, T2));
  Expect.runtimeIsType<
      C<T1, T2, T3> Function<T1 extends dynamic, T2 extends num,
          T3 extends String>(T1, T2)>(C.constr1);
}
