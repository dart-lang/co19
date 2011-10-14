/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface can specify a factory class along with constructor signatures.
 * @description Checks interface child creation using factory.
 * @author iefremov
 * @reviewer msyabro
 */

interface I factory C {
  I();
  int f();
}

class Impl implements I {
  Impl() {}
  int f() {
    return 42;
  }
}

class C {
  factory I() {
    return new Impl();
  }
}


main() {
  Expect.isTrue(new I().f() == 42);  
}
