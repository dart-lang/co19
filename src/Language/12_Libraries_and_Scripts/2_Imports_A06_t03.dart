/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an actual argument to the prefix combinator
 * is not a compile-time constant string that denotes either a valid identifier or the empty string.
 * @description Checks that it is not an error if the value of prefix is an empty string.
 * @author rodionov
 * @reviewer msyabro
 * @note issue 1774
 */

#import("2_Imports_lib.dart", prefix: "");

main() {
  try {
    Expect.equals(1, foo);
  } catch(var e) {}
}
