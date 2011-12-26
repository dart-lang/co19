/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let k be a generative constructor. It is a compile-time error if
 * k's initializer list contains an initializer for a variable that is initialized
 * by means of an initializing formal of k.
 * @description Checks that it is a a compile-time error if k's initializer list contains 
 * an initializer for a variable that is initialized by means of an initializing formal of k
 * (field initializer uses this.name syntax).
 * @compile-error
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 * @note Issue 921 filed
 */

class C {
  C(this.x, foo) : this.x = foo;
  var x;
}

main() {
  try {
    C c = new C(0, 1);
  } catch(var x){}
}
