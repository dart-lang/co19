/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form [e is T] or [e is! T] is accepted as a
 * potentially and compile-time constant expression if [e] is potentially
 * constant or compile-time constant, respectively, and [T] is a compile-time
 * constant type.
 * @description Checks that an expression of the form [e is T] is accepted if
 * [e] is potentially constant
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../../Utils/expect.dart";

class MyClass {
  final String str;
  const MyClass(Object? o) : str = o is String ? o : "undefined";
}

main() {
  const MyClass c1 = MyClass("12345");
  Expect.equals("12345", c1.str);

  const MyClass c2 = MyClass(12);
  Expect.equals("undefined", c2.str);

  const MyClass c3 = MyClass(null);
  Expect.equals("undefined", c3.str);
}
