// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type test, `o is U` or `o is! U`, and a type cast, `o as U`,
/// where `U` is or contains an extension type, is performed at run time as a
/// type test and type cast on the run-time representation of the extension type
///
/// @description Check that at run time a type cast, `o as U` is performed as a
/// type cast on the run-time representation of the extension type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type V1(int id) {}

extension type V2<T>(T id) {}

bool testAsInt(Object? instance) {
  try {
    instance as int;
    return true;
  } catch (_) {
    return false;
  }
}

bool testAsV1(Object? instance) {
  try {
    instance as V1;
    return true;
  } catch (_) {
    return false;
  }
}

bool testAsT<T>(Object? instance) {
  try {
    instance as T;
    return true;
  } catch (_) {
    return false;
  }
}

bool testAsV2<T>(Object? instance) {
  try {
    instance as V2<T>;
    return true;
  } catch (_) {
    return false;
  }
}

void main() {
  int i = 42;
  var v1 = V1(i);
  var v2 = V2<num>(i);

  List<int> l = [];
  var v3 = V2<List<int>>(l);

  var objects = [
    true,
    3.14,
    i,
    v1,
    v2,
    l,
    v3,
    "String",
    #foo,
    <String>[],
    {'a': () {}},
    {42,},
    (),
    (42,),
    StringBuffer('Hello')
  ];

  for (var o in objects) {
    Expect.equals(testAsInt(o), testAsV1(o));
    Expect.equals(testAsT<int>(o), testAsV2<int>(o));
    Expect.equals(testAsT<List<int>>(o), testAsV2<List<int>>(o));
  }
}
