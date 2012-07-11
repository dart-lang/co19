/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an actual argument to the prefix combinator
 * is not a compile-time constant string that denotes either a valid identifier or the empty string.
 * @description Checks that it is a compile-time error if prefix value contains
 * curly braces.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

#import("2_Imports_lib.dart", prefix: "pre{fix}");

main() {
  try {
    Expect.equals(1, extends.foo);
  } catch(var e) {}
}
