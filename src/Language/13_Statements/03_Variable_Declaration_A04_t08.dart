/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if e refers to the name v or the name v=.
 * @description Checks that it is a compile-time error if the initializing expression
 * of a local variable v refers to the name v= even when a top-level variable 
 * with the same name is declared.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 * @issue 7052
 */

var v = 0;

main() {
  var v = (v=1);
}
