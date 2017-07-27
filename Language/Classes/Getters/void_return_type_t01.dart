/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the return type of a getter is void.
 * @description Checks that a static warning is produced if the return type 
 * of declared getter is void.
 * @author ngl@unipro.ru
 */


class A {
  void get foo {
  }
}

main() {
  new A().foo;
}
