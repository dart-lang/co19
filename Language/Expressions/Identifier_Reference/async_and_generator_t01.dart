/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any of the identifiers async, await
 * or yield is used as an identifier in a function body marked with either
 * async, async* or sync*.
 * @description Checks that it is no a compile-time error if async, await or
 * yield are used in the method not marked with async, async* or sync*.
 * @author ngl@unipro.ru
 */

f() {
  int async = 1;
  int await = 2;
  int yield = 3;
  return async + await + yield;
}

main() {
  f();
}

