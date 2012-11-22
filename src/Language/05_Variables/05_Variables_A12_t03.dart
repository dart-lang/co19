/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration of one of the forms
 * T v;, T v = e; , const T v = e;, final T v; or final T v = e;
 * always induces an implicit getter function with signature
 *   T get v
 * whose invocation evaluates as described below.
 * @static-warning
 * @author pagolubev
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  int v = null;
}

main() {
  A a = new A();
  bool b = a.v;
}
