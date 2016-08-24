/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static variables are variables whose declarations are
 * immediately contained  within a class declaration and that are declared
 * static. The static variables of a class C are those static variables
 * declared by C.
 * @description Checks that superclass's static variables are unaccessible
 * via subclass's name.
 * @compile-error
 * @author ilya
 */

class S {
  static var foo;
}

class C extends S {
}

main() {
  C.foo;
}
