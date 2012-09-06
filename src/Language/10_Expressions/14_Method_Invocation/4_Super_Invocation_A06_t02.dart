/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if S does not have an accessible
 * instance member named m.
 * @description Checks that it is a static type warning if member m in S is inaccessible.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview issue 3266, issue 3267
 */

#import("lib.dart");

//library code

// #library("lib");
//
// class C {
//   _func() {}
// }

class A extends C {
  test() {
    try {
      super._func();
      Expect.fail("NoSuchMethodException is expected");
    } on NoSuchMethodException catch(e) {}
  }
}

main() {
  new A().test();
}