/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The body is empty for functions that are external.
 * @description Checks it is a compile error if external function declaration
 * is followed by a function body.
 * @compile-error
 * @author ilya
 */

external foo(String x) => x.length;

main() {
  foo('foo');
}
