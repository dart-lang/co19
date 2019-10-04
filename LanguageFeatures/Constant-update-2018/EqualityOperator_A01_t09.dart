/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [==] operator in constant expressions was defined such that
 * [e1 != null] was only allowed if [e1] had one of the "primitive" system
 * types. Users had to rewrite their code to [!identical(e1, null)]. This was
 * changed so that the [==] expression is always allowed as long as one of the
 * operands is [null].
 * @description Checks that [==] operator is allowed if one of the operands is
 * [null] in potentially constant or compile-time constant, and compile time
 * error is thrown if assertion fails.
 * @compile-error
 * @author iarkh@unipro.ru
 */

const str1 = "test";
const str2 = null;

class MyClass {
  final String option;
  const MyClass(String str) : assert(str == null), this.option = "OK";
}

main() {
  const MyClass c1 = MyClass("123");
}
