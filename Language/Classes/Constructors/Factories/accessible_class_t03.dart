/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if type does not denote a class
 * accessible in the current scope; if type does denote such a class C it is
 * a static warning if the referenced constructor (be it type or type.id) is
 * not a constructor of C.
 * @description Checks that a compile error is produced if referenced type in
 * redirecting constructor is a function.
 * @compile-error
 * @author ilya
 */

function() {}

class F {
  factory F() = function;
}

main() {
  try {
    new F();
  } catch (e) {}
}
