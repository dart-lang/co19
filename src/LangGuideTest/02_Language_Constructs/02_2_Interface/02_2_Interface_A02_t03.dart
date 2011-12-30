/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface can specify a factory class along with constructor signatures.
 * @description Checks that a class specified as a factory for some interface must have
 * a corresponding factory constructor.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

interface I default C {
  I();
}

class C {
  C() {}
}


main() {
  new I();
}
