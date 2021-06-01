// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We do not try to distinguish the cases where the type arguments
/// are passed directly to the original class in the same order vs. those where
/// they are modified along the way.
///
/// @description Checks case where type argument is not passed directly to the
/// original class
///
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A<T1, T2> {
  A.testme() {}
}
typedef AAlias<X, Y> = A<X, Y>;

class B<T1, T2> {
  var v1 = AAlias.testme;
  var v2 = AAlias.testme;
}

main() {
  B b1 = B();
  Expect.notEquals(b1.v1, b1.v2);

  B b2 = B<int, String>();
  Expect.identical(b2.v1, b2.v2);
  Expect.identical(A<int, String>.testme, b2.v2);

  B b3 = B<Never, List>();
  Expect.identical(b3.v1, b3.v2);
  Expect.identical(A<Never, List>.testme, b3.v1);

  B b4 = B<dynamic, List<int>>();
  Expect.identical(b4.v1, b4.v2);
  Expect.identical(A<dynamic, List<int>>.testme, b3.v1);
}
