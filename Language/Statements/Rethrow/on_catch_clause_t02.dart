/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a rethrow statement is not enclosed
 * within an on-catch clause.
 * @description Checks that it is a compile-time error if a rethrow statement
 * is not enclosed within an on-catch clause.
 * @compile-error
 * @author kaigorodov
 */

void f0() {
  throw "foo";
}

main() {
  try {
    f0();
  } finally {
    rethrow;
  }
}
