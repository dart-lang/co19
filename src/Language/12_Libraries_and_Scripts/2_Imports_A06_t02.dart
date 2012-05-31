/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the optional argument a (prefix value) is not
 * a compile-time constant, or if a involves string interpolation.
 * @description Checks that it is a compile-time error if the prefix involves string interpolation.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("2_Imports_lib.dart", prefix: "x${new A()}");

class A {
  toString() => 'prefix';
}

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
