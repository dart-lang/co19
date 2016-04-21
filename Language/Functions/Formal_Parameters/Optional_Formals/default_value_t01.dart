/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the default value of an optional
 * parameter is not a compile-time constant.
 * @description Checks that it is a compile-time error if the default value
 * of an optional parameter is not a compile-time constant.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

main() {
  try {
    int x = 1;
    void func([var y = x]) {}
  } catch (x) {}
}
