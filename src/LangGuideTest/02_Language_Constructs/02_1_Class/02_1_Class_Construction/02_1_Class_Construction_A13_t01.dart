/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The created object (this) is not accessible in the initializer list of the constructor. 
 * This ensures that the program can never observe the value of a constant field changing.
 * @description Checks that this is not accessible in the initializer list.
 * @author iefremov  
 * @compile-error
 * @reviewer msyabro
 */ 

class C {
  C() : v = this.c, c = 1, v = this.c {}
  var v;
  final c;
}


void main() {
  var c = new C(); 
}
