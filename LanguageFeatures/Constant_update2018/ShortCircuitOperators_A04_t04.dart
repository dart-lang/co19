/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potenatially constant
 * expression.
 * @description Checks that exception appears if the first operand of
 * conditional operator [?]/[:] is not a potentially constant, even if the
 * second one is [true].
 * @compile-error
 * @author iarkh@unipro.ru
 */
bool b;

class MyClass {
  final bool res;
  const MyClass(bool test) : res = (false ?? b : test); // #01: compile-time error
}

main() {
  const String str = false ? b : "OK";                  // #02: compile-time error
}
