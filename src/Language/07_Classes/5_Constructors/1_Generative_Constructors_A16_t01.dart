/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The initializing formal does effect the type of the constructor function 
 * exactly as if a formal parameter named id in the same position would.
 * @description Checks that an initializing formal affects the type of the constructor
 * function the same way a regular formal parameter of the same static type would.
 * @author rodionov
 * @needsreview There doesn't seem to be a way to reference a constructor the same way
 * you can reference a method.
 */

typedef void FI(int);
typedef void FS(String);

class C {
  int x;
  C(this.x) {}
}

main() {
//  Expect.isTrue(C.C is FI);
//  Expect.isFalse(C.C is FS);
}
