/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let k be a generative constructor. If no superinitializer is
 * provided, an implicit superinitializer of the form super() is added at the
 * end of k's initializer list, unless the enclosing class is class Object.
 * @description Checks that implicit super constructor is invoked after all of
 * k's initializers.
 * @author iefremov
 */
import "../../../../Utils/expect.dart";

var global = "";

class A {
  A() {global = "${global}A";}
}

class C extends A {
  C(var f) : y = f();
  var y;
}

main() {
  var c = new C(() {global = "${global}C";});
  Expect.equals("CA", global,
      "implicit superinitializer was called before initializers!");
}
