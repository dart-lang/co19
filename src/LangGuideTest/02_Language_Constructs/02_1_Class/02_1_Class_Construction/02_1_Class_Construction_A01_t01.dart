/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion New instances of classes are created with the new keyword followed by a reference to a
 * constructor. 
 * @description Checks creation of new instances using various constructors.
 * @author iefremov 
 * @reviewer msyabro
 */ 

class C {
  C() {}
  C.make() {}
  factory C.makeC() {return new C();}
}

main() {
  var c1 = new C();
  var c2 = new C.make();
  var c3 = new C.makeC();   
}
