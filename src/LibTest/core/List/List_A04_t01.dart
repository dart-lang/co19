/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Checks that IllegalArgumentException is thrown.
 * @author varlax
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  checkTypeError( () {
    try {
      List a = new List(0.1);
      Expect.fail("IllegalArgumentException is expected");
    } catch(IllegalArgumentException e) {}
  });

  checkTypeError( () {
    try {
      List a = new List("1");
      Expect.fail("IllegalArgumentException is expected");
    } catch(IllegalArgumentException e) {}
  });

  checkTypeError( () {
    try {
      List a = new List(true);
      Expect.fail("IllegalArgumentException is expected");
    } catch(IllegalArgumentException e) {}
  });

}
