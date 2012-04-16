/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the value of prefix is not a valid identifier.
 * @description Checks that it is a compile-time error if the value of prefix begins with a space.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("1_Imports_lib.dart", prefix: " foo");

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
