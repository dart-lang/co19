/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an actual argument to the prefix combinator
 * is not a compile-time constant string that denotes either a valid identifier or the empty string.
 * @description Checks that it is a compile-time error if prefix is the reserved word 'return'.
 * @compile-error
 * @author vasya
 * @reviewer hlodvig
 * @reviewer msyabro
 */

#import("2_Imports_lib.dart", prefix: "return");

main() {
  try {
    Expect.equals(1, return.foo);
  } catch(var e) {}
}
