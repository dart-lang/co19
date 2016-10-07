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
 * @description  Checks that references to a library function and local function
 * are evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

import '../lib.dart' as lib;

main() {
  localFunc() {return 2;}
  var e1 = localFunc;
  Expect.equals(2, e1());
  var e2 = lib.f;
  Expect.equals(1, e2());
}
