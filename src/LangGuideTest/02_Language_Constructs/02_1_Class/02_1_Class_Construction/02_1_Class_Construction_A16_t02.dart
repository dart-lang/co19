/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Prefixing a constructor with word 'factory' turns the constructor into a
 * factory constructor. A factory constructor is responsible for creating the actual instance.
 * @description Checks that a class can contain both factory and non-factory constructors.
 * @author iefremov
 * @reviewer msyabro
 */ 
interface I default C {
  I();
}

class C {
  C() {}
  factory I() {
    return null;
  }
}


main() {
  new C();
  Expect.isTrue(null == new I());
}
