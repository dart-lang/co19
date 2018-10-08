/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance getter 
 * named v and an accessible static member named v or v = is declared in a 
 * superclass of C.
 * @description Checks that a compile error is arisen if a class C has an
 * implicitly declared instance getter and an static varible with the same 
 * name in a superclass.
 * @compile-error
 * @author ngl@unipro.ru
 */

class A {
  static int v;
}

class C extends A {
  int v = 5;
}

main() {
  new C().v;
}
