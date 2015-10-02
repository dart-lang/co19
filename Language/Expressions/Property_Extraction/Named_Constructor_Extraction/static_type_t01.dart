/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the type of the constructor function,
 * if T denotes a class in the surrounding scope with an accessible constructor
 * f named m. Otherwise the static type of i is dynamic
 * @description Check that static type of the extracted named constructor
 * is function
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class C {
  C.m();
}

main() {
  Function i = new C#m;
  C o = i();
}
