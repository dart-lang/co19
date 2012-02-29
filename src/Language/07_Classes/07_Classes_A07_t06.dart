/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class declares two members of the same name,
 * except that a getter and a setter may be declared with the same name provided
 * both are instance members or both are static members.
 * @description Checks that it is a compile-time error if a class declares 
 * a function and an abstract setter of the same name.
 * @compile-error
 * @author rodionov
 */

class C {
  String f(int f);
  abstract int set f(bool b);
}

main() {
  try {
    C c = new C();
  } catch(var e) {}
}

