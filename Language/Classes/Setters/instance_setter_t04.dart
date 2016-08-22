/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance setter
 * named v= and an accessible static member named v= or v is declared in a
 * superclass of C.
 * @description Checks that a compile error is arisen if a class has an
 * implicitly declared instance setter and a static getter with the same name
 * declared in a superclass.
 * @compile-error
 * @author ngl@unipro.ru
 */

class A {
  static int n;
  static get v { return n; }
}

class C extends A {
  int v;
}

main() {
  new C().v = 5;
}
