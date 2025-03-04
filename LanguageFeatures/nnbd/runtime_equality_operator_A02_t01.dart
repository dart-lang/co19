// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Note that we do not equate primitive top types. List<void> and
/// List<dynamic> are still considered distinct runtime type objects. Note that
/// we also do not equate Never and Null, and we do not equate function types
/// which differ in the placement of required on parameter types.
///
/// @description Checks that primitive types are not equal
/// equal
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

test<T1, T2>() {
  List<T1> l1 = [];
  List<T2> l2 = [];
  Expect.notEquals(l1.runtimeType, l2.runtimeType);
}

main() {
  test<void, dynamic>();
  test<Never, Null>();
  test<void, Null>();
  test<dynamic, Null>();
  test<Never, dynamic>();
  test<Object?, dynamic>();
  test<Never, void>();
}
