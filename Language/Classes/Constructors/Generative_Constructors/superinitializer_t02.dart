/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let k be a generative constructor. Then k may include at most one
 * superinitializer in its initializer list or a compile-time error occurs.
 * @description Checks that it is a a compile-time error if a generative
 * constructor includes two identical superinitializers in its initializer list.
 * @compile-error
 * @author iefremov
 */

class A {
  A();
}

class B extends A {
  B() : super(), super();
}

main() {
  try {
    var x = new B();
  } catch (x) {}
}
