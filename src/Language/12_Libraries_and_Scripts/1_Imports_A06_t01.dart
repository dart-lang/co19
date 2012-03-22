/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if either URI or prefix is not a compile-time constant.
 * @description Checks that it is a compile-time error if URI is not a compile-time constant. 
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("${2 - 1}_Imports_lib.dart");

main() {
  try {
    var someVar = 1;
  } catch(var e) {}
}
