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
 * with the name of a getter in the same class.
 * @author kaigorodov
 * @compile-error
 */

class C {
  var get foo {};
  C.foo();
}

main() {
  try {
    new C.foo();
  } catch (e){}
}
