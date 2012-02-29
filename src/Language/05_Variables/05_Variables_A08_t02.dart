/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a top level variable is initialized with
 * an expression that is not a compile-time constant.
 * @description Checks that it is a compile-time error if a top level variable is
 * initialized with an expression that is not a compile-time constant.
 * @compile-error
 * @author msyabro
 */

var foo = new Object(); // error

main() {
  try {
    Expect.isTrue(foo is List);
  } catch(var x){}
}

