/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration is a function that is neither a member
 * of a class nor a function literal. Function declarations include library
 * functions, which are function declarations at the top level of a library,
 * and local functions, which are function declarations declared inside other
 * functions. Library functions are
 * often referred to simply as top-level functions.
 * A function declaration consists of an identier indicating the function's
 * name, possibly prefaced by a return type. The function name is followed by
 * a signature and body. For getters, the signature is empty. The body is empty
 * for functions that are external.
 * The scope of a library function is the scope of the enclosing library. The
 * scope of a local function is described in section
 * (Statements/Local Function Declaration). In both cases, the name of the
 * function is in scope in its formal parameter scope.
 * It is a compile-time error to preface a function declaration with the
 * built-in identier static.
 * @description Checks that two top-level functions are in the scope of each other and can be mutually
 * recursive.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

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
