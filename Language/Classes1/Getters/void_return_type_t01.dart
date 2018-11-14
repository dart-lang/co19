/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the return type of a getter is void.
 * @description Checks that with a generalized void it is no static warning if
 * the return type of declared getter is void.
 * @static-clean
 * @author ngl@unipro.ru
 */


class A {
  void get foo {
  }
}

main() {
  new A().foo;
}
