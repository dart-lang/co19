/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no return type is specified in typedef declaration, it is taken to be Dynamic.
 * @description Indirectly verifies the assertion: checks that function types with various return types
 * are subtypes of given type t1 that declares no return type, therefore the return type of t1 should be Dynamic.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview Currently the test will pass if omitted annotation is taken to be Object.
 */

typedef f1();

typedef func();
typedef int func2(int x);

main() {
  Expect.isTrue(int f(){} is f1);
  Expect.isTrue(Object f(){} is f1);
  Expect.isTrue(func f(){} is f1);
  Expect.isTrue(func2 f(){} is f1);
}

