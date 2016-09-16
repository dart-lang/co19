/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that reference to a top-level setter is evaluated to the
 * getter invocation.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

var c = 1;
get s1 => ++c;
set s1(x) {c = x;}
set s2(x) {c = x;}

void f() {
  Expect.equals(c, 1);
  Expect.equals(s1, 2);
  Expect.equals(s1 = 4, 4);
  Expect.equals(s2 = 5, 5);
}

main() {
  f();
}
