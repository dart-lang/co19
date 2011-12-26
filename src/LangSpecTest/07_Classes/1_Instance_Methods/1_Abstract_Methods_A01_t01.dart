/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any default values are
 * specified in the signature of an abstract method.
 * @description Checks that a compile-time error is produced when a single 
 * optional parameter with default value is specified in the abstract method signature.
 * @compile-error
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class C {
  abstract m1([var v = null]);
}

main() {
  try {
    new C().m1();
  } catch(var ok){}
}

