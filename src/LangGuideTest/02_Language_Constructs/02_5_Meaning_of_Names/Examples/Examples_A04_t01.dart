/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Within a method or function body, it is not legal to refer to a later declaration.
 * @description Try to refer to a later declaration of function.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */


void main() {
  f();
  void f() {}
}
