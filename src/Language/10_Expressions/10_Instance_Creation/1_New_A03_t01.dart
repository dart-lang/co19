/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e of the form new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) it is a
 * compile-time error if T.id is not the name of a constructor declared by the type T.
 * @description Checks that it is a compile-time error if a class does not declare
 * named constructor T.id.
 * @compile-error
 * @author msyabro
 */

class C {}

main() {
  try {
    new C.namedConstructor();
  } catch(var e) {}
}