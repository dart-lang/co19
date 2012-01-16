/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a type annotation is omitted on a formal parameter in typedef declaration, it is taken to be Dynamic.
 * @description Indirectly verifies the assertion: checks that function types with various types of formal optional parameter
 * are subtypes of given type t1 whose declaration omits parameter types, therefore the type of formal parameter
 * of t1 should be Dynamic.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview Currently the test will pass if omitted annotation is taken to be Object.
 */

typedef f1([x]);

typedef func();
typedef int func2(int x);

main() {
  Expect.isTrue(f([int x]){} is f1);
  Expect.isTrue(f([Object x]){} is f1);
  Expect.isTrue(f([func x]){} is f1);
  Expect.isTrue(f([func2 x]){} is f1);
}

