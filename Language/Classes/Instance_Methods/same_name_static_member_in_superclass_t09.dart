/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance method
 * named n and an accessible static member named n is declared in a superclass 
 * of C.
 * @description Checks that a compile-error is produced when a class declares
 * an instance method with the same name as a static method in its superclass.
 * @compile-error
 * @author iefremov
 */

import "same_name_static_member_in_superclass_lib.dart";

class C extends A {
  f() {
  }
}

main() {
  new C().f();
}
