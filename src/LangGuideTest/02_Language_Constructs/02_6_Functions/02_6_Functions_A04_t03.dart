/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameters of a method is a (possibly empty) list of positional
 * parameters optionally followed by either a rest parameter or a section with named
 * optional parameters.
 * @description Checks that combining rest parameters and named optional parameters is not allowed.
 * @author pagolubev
 * @reviewer iefremov
 * @compile-error
 */

class A {
  void g1([int x], ...z) {}
}


void main() {
}
