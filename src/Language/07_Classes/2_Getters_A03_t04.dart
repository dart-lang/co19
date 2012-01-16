/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a getter`s formal parameter list is not empty. 
 * @description Checks that a compile-time error is produced if an arbitrary instance getter specifies
 * an optional formal parameter with a default value.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C {
  get getter([var value = null]) { throw new C(); }
}

main() {
  try {
    var x = new C().getter;
  } catch(var x) {}
}
