/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class declares two members of 
 * the same name.
 * @description Checks that it is a compile-time error if a class declares 
 * a variable and an instance method of the same name.
 * @compile-error
 * @author rodionov
 */

class C {
  var f;
  String f(int f) {}
}

main() {
  try {
    new C();
  } catch (e) {}
}
