/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To avoid the repetitive this.name = name initializers Dart allows to write
 * this.name instead of the argument-name. This eliminates the argument variable and 
 * directly assigns the field with the passed value. It is not possible to use the passed
 * value to initialize other arguments.
 * @description Checks that value of the argument is assigned to the field.
 * @author iefremov
 * @reviewer msyabro  
  */ 

class C {
  C(this.v, z_, this.c) : z = z_  {}
  var v;
  final c;
  var z;
}


main() {
  var c = new C(42, "z", 6031769); 
  Expect.isTrue(c.v == 42);
  Expect.isTrue(c.c == 6031769);
  Expect.isTrue(c.z == "z");
}
