/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The first implicit action of a constructor is to call the super constructor 
 * (unless the constructor is in Object).
 * @description Checks that Object constructor should not be called from const constructor.
 * @author iefremov 
 * @reviewer msyabro
 */ 

class B {
  const B();
}

class A extends Object{
  const A() : i = const B();
  final i;
}


main() {
  final a = const A();
}
