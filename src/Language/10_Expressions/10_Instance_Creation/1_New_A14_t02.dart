/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a new expression of either the form
 * new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) or the form
 * new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is T.
 * It is a static warning if the static type of ai, i from 1 to n+k may not be
 * assigned to the type of the corresponding formal parameter of the constructor
 * T.id (respectively T).
 * @description Checks that it is a static type warning if the static type of
 * one of arguments can't be assigned to the type of the corresponding parameter
 * of the constructor.
 * @static-warning
 * @author msyabro
 */

class C {
  C(int p1) {}
}

main() {
  try {
    C c = new C("");
  } catch(TypeError e) {}
}