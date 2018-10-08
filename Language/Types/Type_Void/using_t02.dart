/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In an expression of the form e1 = e2 where e1 is an
 * assignableExpression denoting a variable or parameter of type void, e2 may
 * have the type void.
 * @description Checks that it is a compile error when assigning the result of
 * a void method invocation to a variable whose declared type is not dynamic
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

void foo() {
  return;
}

main() {
  int i = foo();
}
