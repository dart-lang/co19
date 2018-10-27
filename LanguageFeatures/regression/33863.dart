/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the Issue 33863 (Dart does not throw error
 * if parameter of incorrect type is passed to the function): Checks that
 * parameter type is checked correctly for functions.
 * @compile-error
 * @author iarkh@unipro.ru
 */

testme<X extends int>(X x) {}

main() {
  testme("incorrect param");
}
