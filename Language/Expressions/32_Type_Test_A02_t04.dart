/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the is-expression e is T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the
 * is-expression evaluates to true.
 * Otherwise it evaluates to false.
 * @description Checks that if T is parameterized type and G is malformed, then
 * T is malformed and dynamic error occurs.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

main() {
  Expect.throws(() => 1 is G<int, bool>); /// static type warning
}
