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
 * • If d is a static method, top-level function or local function then e
 *   evaluates to the function defined by d.
 * @description Checks that a reference to a function parameter is evaluated
 * correctly in closures.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

func(var a, [var b = 1]) => () => a * b;

main() {
  Expect.equals(1, func(1)());
  Expect.equals(2, func(2)());
  Expect.equals(4, func(2, 2)());
  Expect.equals(0, func(0, 1)());
}
