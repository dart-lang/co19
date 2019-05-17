/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let k be a generative constructor. If no superinitializer is
 * provided, an implicit superinitializer of the form super() is added at the
 * end of k's initializer list, unless the enclosing class is class Object.
 * @description Checks that super constructor is invoked if no superinitializer
 * is provided. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../../Utils/expect.dart";

class A {
  A() : x = 13;
  var x;
}
typedef AAlias = A;

class C extends AAlias {
  C();
}

main() {
  var c = new C();
  Expect.equals(13, c.x);
}
