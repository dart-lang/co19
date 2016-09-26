/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression statement consists of an expression other than a
 * non-constant map literal that has no explicit type arguments.
 * The restriction on maps is designed to resolve an ambiguity in the grammar,
 *   expressionStatement:
 *     expression? ‘;’
 *   ;
 * Execution of an expression statement e; proceeds by evaluating e.
 * It is a compile-time error if a non-constant map literal that has no explicit
 * type arguments appears in a place where a statement is expected.
 * @description Checks that execution of an expression statement e; proceeds by
 * evaluating e.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

foo(x, y, z) { return x + y - z; }

var v;

bar() {
  v = 1;
}

bar2() {
  v = 2;
}

main() {
  dynamic e = 1 + 6 / 3 * 12;
  Expect.equals(25, e);

  e = true || false;
  Expect.equals(true, e);

  e = "A" "B";
  Expect.equals("AB", e);

  e = foo(0, 1, 2);
  Expect.equals(-1, e);

  bar();
  Expect.equals(1, v);

  false ? bar() : bar2();
  Expect.equals(2, v);

  true || false;
}

