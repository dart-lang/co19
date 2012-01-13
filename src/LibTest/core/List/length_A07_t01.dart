/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Checks that IllegalArgumentException is thrown.
 * @author varlax
 * @needsreview undocumented
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  List a = new List();

  checkTypeError( () {
    try {
      a.length = "12";
      Expect.fail("Exception expected when setting ga.length to negative");
    } catch(IllegalArgumentException ok){}
  });

  List<int> b = new List.from(<int>[1,3,5]);
  checkTypeError( () {
    try {
      b.length = 12.43;
      Expect.fail("Exception expected when setting ga.length to negative");
    } catch(IllegalArgumentException ok){}
  });

  checkTypeError( () {
    try {
      b.length = a;
      Expect.fail("Exception expected when setting ga.length to negative");
    } catch(IllegalArgumentException ok){}
  });
}
