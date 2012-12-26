/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Attempting to assign to a final variable elsewhere will cause a
 * NoSuchMethodError to be thrown, because no setter is defined for it.
 * The assignment will also give rise to a static warning for the same reason.
 * @description Checks that a static warning is given as well as NoSuchMethodError thrown
 * when a final variable is assigned outside of initializing expression or constructor.
 * @author kaigorodov
 * @reviewer rodionov
 */
 
class C {
  final v=1;
  
  C() {
   init();
  }
  
  void init() {
    v=1; /// static warning
  }
}

main() {
  Expect.throws(()=>new C(), (e) => e is NoSuchMethodError);
}
