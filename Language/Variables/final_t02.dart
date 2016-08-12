/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose binding is fixed upon
 * initialization; a final variable v will always refer to the same object
 * after v has been initialized. The declaration of a final variable must
 * include the modifier final.
 * It is a static warning if a final instance variable that has been
 * initialized at its point of declaration  is  also initialized in a
 * constructor.
 * It is a compile-time error if a local variable v is final and v is not
 * initialized at its point of declaration.
 * @description Checks that a compile error occurs if a final instance
 * variable that has been initialized in declaration is also initialized in
 * a constructor.
 * @compile-error
 * @author rodionov
 * @issue 12539
 */

class C {
  final v = 1;
  
  C(this.v) {}
}

main() {
  new C(1);
}
