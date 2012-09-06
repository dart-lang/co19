/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An abstract method (respectively, abstract getter or abstract setter)
 * declares an instance method, getter or setter without providing an implementation.
 * @description Checks that instance method, getter or setter can be declared without
 * providing an implementation.
 * @author kaigorodov
 */

class C {
  void m();
  int get g;
  set g(int v);
}

main() {
  C c=new C();
}
