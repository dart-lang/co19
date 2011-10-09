/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An abstract method is a function declaration without a body.
 * An abstract method is a member of a class or an interface.
 * @description Checks that a local function can not be an abstract method.
 * @author pagolubev
 * @reviewer iefremov
 * @compile-error
 */


void main() {
  void f();
}
