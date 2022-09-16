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
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A<T1, T2> {
  A.testme() {}
}
typedef AAlias1 = A<int, String>;
typedef AAlias2 = A;
typedef AAlias3 = A<Never, Null>;
typedef AAlias4<T> = A<T, String>;
typedef AAlias5<T> = A<int, T>;

main() {
  Expect.equals(A<int, String>.testme, AAlias1.testme);
  Expect.identical(A<int, String>.testme, AAlias1.testme);
  Expect.equals(A<dynamic, dynamic>.testme, AAlias2.testme);
  Expect.identical(A<dynamic, dynamic>.testme, AAlias2.testme);
  Expect.equals(A<Never, Null>.testme, AAlias3.testme);
  Expect.identical(A<Never, Null>.testme, AAlias3.testme);
  Expect.equals(A<int, String>.testme, AAlias4<int>.testme);
  Expect.identical(A<int, String>.testme, AAlias4<int>.testme);
  Expect.equals(A<int, String>.testme, AAlias5<String>.testme);
  Expect.identical(A<int, String>.testme, AAlias5<String>.testme);
}
