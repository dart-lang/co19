/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to specify a body for an abstract method.
 * @description Checks that a compile-time error is produced when an abstract method
 * has a body.
 * @compile-error
 * @author msyabro
 */

class C {
  abstract m1() {}
}

main() {
  try {
    new C().m1();
  } catch(var ok){}
}

