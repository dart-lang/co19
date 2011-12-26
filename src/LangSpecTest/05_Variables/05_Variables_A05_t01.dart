/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable that is both static and final must be initialized to 
 * a compile-time constant (10.1) or a compile-time error occurs. 
 * @description Checks that a compile-time error occurs if a static final variable is not initialized.
 * @author vasya
 * @reviewer kaigorodov
 * @compile-error
 */

class C {
  static final foo;
}

main() {
  try {
    new C();
  } catch(var x){}
}

