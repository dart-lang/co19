/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.3: It is a compile-time error if a setter's formal parameter list does not consist of
 * exactly one required formal parameter p.
 * @description Checks that it is a compile-time error if an interface declares a setter
 * with just optional parameters and no formal ones.
 * @author vasya
 * @compile-error
 * @reviewer rodionov
 */

interface I {
  void set s([int i]);
}

class A implements I {}

main() {
  try {
    new A();
  } catch(var e) {}
}
