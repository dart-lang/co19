/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface can specify the signatures of constructors that are used 
 * to provide objects that conform to the interface.
 * @description Checks that it's a compile-time error if an interface constructor has a body.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview issue 971
 */

class F implements I {
  F() { }
  factory I() {return new F();}
}

interface I default F {
  I() {}
}

main() {
  try {
    new I();
  } catch(e) {}
}
