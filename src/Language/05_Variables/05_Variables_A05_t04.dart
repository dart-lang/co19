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
 * @description Checks that it is a compile-time error when a final instance variable that
 * has been initialized by means of an initializing formal of a constructor is also initialized
 * elsewhere in the same constructor.
 * @compile-error
 * @author rodionov
 * @issue 5881
 */

class C {
  final v;
  
  C(this.v) {
    v = 1;
  }
}

main() {
  try {
    new C(1);
  } catch(ok) {}
}
