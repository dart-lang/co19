/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interpolated string "s1${e}s2" is equivalent to the
 * concatenation of the strings "s1", e.toString() and "s2".
 * @description Checks that it is a compile error if e.toString() does not
 * return an object of type string.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  toString() => 1;
}

main() {
  "${new A()}";
}
