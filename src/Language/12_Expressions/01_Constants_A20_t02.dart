/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression that denotes a constant variable or a class
 * is a constant expression.
 * @description Checks that an identifier expression that denotes a class
 * can be assigned to a constant variable.
 * @author kaigorodov
 * @reviewer rodionov
 * @issue 6556
 */

class C {}

const a = String;
const b = int;
const c = List;
const c2 = Map;
const d = C;

main() {
  print(a);
  print(b);
  print(c);
  print(c2);
  print(d);
}
