/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * getterSignature:
 *   returnType? get identifier
 * ;
 * @description Checks that a compile-time error is produced if an arbitrary 
 * static getter specifies
 * a single formal parameter.
 * @compile-error
 * @author vasya
 */

class C {
  static get getter(var value) {throw new C();}
}

main() {
  try {
    var x = C.getter;
  } catch (e) {}
}
