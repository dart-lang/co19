// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Two objects T1 and T2 which are instances of Type (that is,
/// runtime type objects) are considered equal if and only if the runtime type
/// objects T1 and T2 corresponds to the types S1 and S2 respectively, and the
/// normal forms NORM(S1) and NORM(S2) are syntactically equal up to equivalence
/// of bound variables and ignoring * modifiers on types.
///
/// @description Checks that runtime type of objects T1 and T2 are equal if and
/// only if the runtime type objects T1 and T2 corresponds to the types S1 and S2
/// respectively, and the normal forms NORM(S1) and NORM(S2) are syntactically
/// equal
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {}

test<T>(T t1, T t2) {
  List<T> l1 = [];
  List<T?> l2 = [t1, t2];
  Expect.notEquals(l1.runtimeType, l2.runtimeType);
}

main() {
  test<int>(1, 2);
  test<C>(C(), C());
}
