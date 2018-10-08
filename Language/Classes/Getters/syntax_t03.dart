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
 * @description Checks that a compile-time error is produced when a getter
 * declaration includes an empty formal parameter list.
 * @compile-error
 * @author kaigorodov
 */

class C {
  get getter() { throw new C(); }
}

main() {
  try {
    var x = new C().getter;
  } on C catch (ok) {}
}
