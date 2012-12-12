/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if e refers to the name v or the name v=.
 * @description Checks that a variable declaration statement var e = e; causes a compile-time error.
 * A top-level variable with the same name is declared.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 * @issue 7052
 */

var v = 0;

main() {
  var v = v;
}
