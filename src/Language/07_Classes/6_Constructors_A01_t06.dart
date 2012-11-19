/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constructor name always begins with the name of its immediately enclosing
 * class or interface, and may optionally be followed by a dot and an identifier id.
 * It is a compile-time error if id is the name of a member declared in the immediately
 * enclosing class.
 * @description Checks that a compile-error is produced when a constructor's id coincides
 * with the name of a static getter declared in the same class.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

class C {
  C.foo() {}
  static int get foo() {}
}

main() {
  try {
    new C.foo();
  } catch (e){}
}
