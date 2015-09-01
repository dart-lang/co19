/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if type does not denote a class
 * accessible in the current scope; if type does denote such a class C it is
 * a static warning if the referenced constructor (be it type or type.id) is
 * not a constructor of C.
 * @description Checks that static warning is produced if referenced type in
 * redirecting constructor is in fact an accessible type, but the
 * referenced name does not denote a constructor.
 * @static-warning
 * @author ilya
 */

class F {
  factory F.foo() = C.foo; // static warning
  factory F.bar() = C.bar; // static warning
}

class C implements F {
  foo() {}
  var bar;
}


main() {
  try {
    new F.foo();
  } catch(e) {}
}
