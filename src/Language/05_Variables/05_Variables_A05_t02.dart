/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose declaration includes the modifier final.
 * It is a compile-time error if a final instance variable that has been initialized
 * at its point of declaration is also initialized in a constructor. It is a compile-time
 * error if a final instance variable that has is initialized by means of an initializing
 * formal of a constructor is also initialized elsewhere in the same constructor.
 * It is a compile-time error if a library, static or local variable v is final and v
 * is not initialized at its point of declaration.
 * @description Checks that a compile-time error occurs if a final instance variable that
 * has been initialized in declaration is also initialized in a constructor.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  final v = 1;
  
  C(this.v) {}
}

main() {
  try {
    new C(1);
  } catch(ok) {}
}
