/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • If d is a constant variable of one of the forms const v = e; or  const
 * T v = e; then the value id is the value of the compile-time constant e.
 * @description Checks that reference to a compile-time constant is evaluated
 * correctly.
 * @author ilya
 */
import '../../../Utils/expect.dart';

const x = 111;
const int y = 222 + x;

main() {
  Expect.equals(111, x);
  Expect.equals(333, y);
}
