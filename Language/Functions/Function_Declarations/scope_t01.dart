/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The scope of a library function is the scope of the enclosing
 * library. The scope of a local function is described in section
 * (Statements/Local Function Declaration). In both cases, the name of the
 * function is in scope in its formal parameter scope.
 * @description Checks that two top-level functions are in the scope of each
 * other and can be mutually recursive.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

int foo(int x) {
  return x >= 0 ? x : bar(-x);
}

int bar(int x) {
  return x >= 0 ? x : foo(-x);
}

main() {
  Expect.equals(1, foo(1));
  Expect.equals(1, bar(1));
  Expect.equals(1, foo(-1));
  Expect.equals(1, bar(-1));
}
