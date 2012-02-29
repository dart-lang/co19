/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if C does not declare a static method or getter m.
 * @description Checks that it is a compile-time error if C does not declare
 * a static method m though its superclass does.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  static m() {}
}

class C extends S{}

main() {
  try {
    C.m();
  } catch(var e) {}
}