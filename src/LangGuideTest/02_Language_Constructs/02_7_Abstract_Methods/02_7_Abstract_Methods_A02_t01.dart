/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameters of an abstract method are the same as the formal parameters
 * of a function, except that default values are not allowed.
 * @description Checks that default values for abstract method parameters are not allowed.
 * @author pagolubev
 * @reviewer iefremov
 * @compile-error
 */

class A {

  abstract void f([int x = 1]);

}



main() {}
