/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Default arguments and variable arguments in a function and the overriden function must also match, or it is an error.
 * @description Different number of default arguments
 * @author msyabro
 * @reviewer iefremov
 * @compile-error
 */

class A {
  void func(int x, [int y = 0]) {}
}

class B extends A {
  void func(int x, int y) {}
}


main() {}
