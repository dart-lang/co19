/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function consists of the following parts:
 * an optional return type, an optional name, a list of formal parameters, and a body.
 * @description Checks that static member function has to have a body.
 * @compile-error
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static foo()
}


main() {}
