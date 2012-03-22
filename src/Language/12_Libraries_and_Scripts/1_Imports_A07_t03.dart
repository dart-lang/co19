/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the value of prefix is not a valid identifier.
 * @description Checks that it is a compile-time error if the value of prefix is an empty string.
 * @author rodionov
 * @compile-error
 * @reviewer msyabro
 */

#import("1_Imports_lib.dart", prefix: "");

main() {
  try {
    Expect.equals(1, foo);
  } catch(var e) {}
}
