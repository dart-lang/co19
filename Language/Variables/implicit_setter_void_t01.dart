/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form T v;
 * or the form T v = e; always induces an implicit setter function 
 * with signature
 *   void set v = (T x)
 * whose execution sets the value of v to the incoming argument x.
 * @description Trivially checks that some arbitrary values of corresponding 
 * type may be assigned to the variables declared with explicitly specified 
 * type.
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class C {
  bool foo;
  String bar = "bar";
}

main() {
  C c = new C();

  c.foo = false;
  Expect.equals(false, c.foo);  
  c.foo = true;
  Expect.equals(true, c.foo);  

  c.bar = "";
  Expect.equals("", c.bar);  
  c.bar = null;
  Expect.equals(null, c.bar);  
}
