/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion On the other hand, it is possible to return the result of a void
 * method from within a void method. One can also return null; or a value of
 * type Dynamic. Returning any other result will cause a type warning. In
 * checked mode, a dynamic type error would arise if a non-null object was
 * returned from a void method (since no object has runtime type dynamic).
 * @description Checks that returning a non-null value with non-dynamic static
 * type from within a void method produces compile error.
 * @compile-error
 * @author rodionov
 */

void foo() {
  String s = "foo";
  return s;
}

main() {
  foo();
}
