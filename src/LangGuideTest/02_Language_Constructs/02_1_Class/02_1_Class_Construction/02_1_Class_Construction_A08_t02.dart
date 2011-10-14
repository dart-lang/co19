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
 * @description Checks that that eliminated variable can not be used to initialize other
 * arguments.
 * @author iefremov  
 * @compile-error
 * @needsreview Isn't this test on assertion about using instance fields in initializers list? 
 * 'x' isn't passed argument but instance field of class.
 * @reviewer msyabro
 */ 

class A {
  int x, y;
  A(this.x) : y = x {}
}


main() {
  
}
