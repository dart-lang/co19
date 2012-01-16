/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [IllegalArgumentException] if [index] is of invalid type.
 * @description Checks that the exception is thrown as expected.
 * @author varlax
 */

#import("../../../Utils/dynamic_check.dart");

check(List a) {
  checkTypeError( () {
    try {
      var idx = 0.1;
      a[idx];
      Expect.fail("expected IllegalArgumentException");
    } catch(IllegalArgumentException ok) {}
  });

  checkTypeError( () {
    try {
      var idx = '23';
      a[idx];
      Expect.fail("expected IllegalArgumentException");
    } catch(IllegalArgumentException ok) {}
  });

  checkTypeError( () {
    try {
      var idx = false;
      a[idx];
      Expect.fail("expected IllegalArgumentException");
    } catch(IllegalArgumentException ok) {}
  });
 
}

void main() {
  check(const [null]);
  check(['sd','sd']);
  check(new List.from(<int>[null, 1, 0]));
  check(new List(100));
}
