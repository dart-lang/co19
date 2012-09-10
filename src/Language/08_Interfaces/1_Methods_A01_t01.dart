/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface method declaration specifies a method signature but no body.
 * @description Checks that specifying an interface method declaration with a body results in a compile error. 
 * @author rodionov
 * @reviewer kaigorodov
 * @compile-error
 * @needsreview issue 971
 */

interface I {
  int m1() {return null;}
}

class A implements I{
  int m1() {}
}

main() {
  try {
    A a = new A();
    a.m1();
  }catch(x){}
}

