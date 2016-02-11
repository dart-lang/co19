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
 * • If d is the declaration of a library variable, top-level getter or
 *   top-level setter, then e is equivalent to the getter invocation id.
 * @description Checks that reference to a top level getter is evaluated
 * correctly.
 * @author msyabro
 * @reviewer kaigorodov
 * @note renamed from 30_Identifier_Reference_A12_t01.dart
 */
import '../../../Utils/expect.dart';

var _x;
get x {return _x;}

main() {
  _x = 1;
  Expect.equals(1, x);
}
