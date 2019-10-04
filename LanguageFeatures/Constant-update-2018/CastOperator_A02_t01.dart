/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form [e as T] is accepted as a potentially
 * and compile-time constant expression if [e] is potentially constant or
 * compile-time constant, respectively, and [T] is a compile-time constant type.
 * A compile-time constant type means any type that doesn't contain free type
 * variables, so the type expression always resolves to the exact same type.
 * @description Checks that an expression of the form [e as T] is accepted if
 * [e] is compile-time constant
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const str = "testme";
const i = 0;

class MyClass {
  final String name;
  const MyClass() : name = (str as String);
}

main() {
  const String str1 = str as String;
  const int i1 = i as int;

  const MyClass c = MyClass();
  Expect.equals("testme", c.name);
}
