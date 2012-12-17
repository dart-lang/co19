/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a new expression of the form
 * new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) or the form
 * new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * It is a static warning if T is not a class accessible in the current scope,
 * optionally followed by type arguments.
 * @description Checks that it is a static warning if T is a reference to
 * a top-level variable.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @issue 5806
 */

var a;

main() {
  try {
    new a();
  } catch(e) {}
}
