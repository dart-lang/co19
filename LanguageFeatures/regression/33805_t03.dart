/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33805 (Analyzer throws error when
 * try to assign a function result to row variable). Checks that error appears
 * if row variable is passed to the function parameter
 * @compile-error
 * @Issue 33805
 * @author iarkh@unipro.ru
 */
import "dart:async";

testme<X extends Future<X>>(X x) {}

Future a = null;

main() {
  testme(a);
}
