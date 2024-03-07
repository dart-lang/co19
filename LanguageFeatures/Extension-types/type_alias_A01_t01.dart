// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias of an extension type can be created
///
/// @description Check that a type alias of an extension type can be created
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension type ET1(int id) {
  int foo() => id;
}

extension type ET2<T>(T id) {
  T get bar => id;
}

typedef ET1Alias = ET1;

typedef ET2Alias<T> = ET2<T>;

typedef ET2StringAlias = ET2<String>;

main() {
  var et1 = ET1Alias(42);
  Expect.equals(42, et1.foo());

  int i = et1 as int;
  Expect.equals(42, i);

  var et2 = ET2Alias<int>(2);
  Expect.equals(2, et2.bar);

  int i2 = et2 as int;
  Expect.equals(2, i2);

  var et3 = ET2StringAlias("X");
  Expect.equals("X", et3.bar);
  String s = et3 as String;
  Expect.equals("X", s);
}
