/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the type of the constructor function T(),
 * if T denotes a class in the surrounding scope with an anonymous constructor
 * T(). Otherwise the static type of i is dynamic.
 * @description Check that it is static warning if the extracted named
 * constructor is assigned to wrong type variable
 * @static-warning
 * @author sgrekhov@unipro.ru
 */

class C {
  C();
}

main() {
  int i = new C#;
}
