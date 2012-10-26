/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Attempting to assign to a ﬁnal variable elsewhere will cause a
 * NoSuchMethodError to be thrown, because no setter is deﬁned for it.
 * The assignment will also give rise to a static warning for the same reason.
 * @description Checks that a static warning occur when a final variable is assigned
 * elsewhere except for initializing expression and constructor.
 * @static-warning
 * @author kaigorodov
 */
 
class C {
  final v=1;
  
  C() {
   init();
  }
  
  void init() {
    v=1;
  }
}

main() {
  Expect.throws(()=>new C(), (e) => e is NoSuchMethodError);
}
