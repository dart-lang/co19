/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [IllegalArgumentException] if [index] is of invalid type.
 * @description Checks that the exception is thrown as expected.
 * @author varlax
 * @reviewer iefremov
 * @needsreview issue 3223
 */

#import("../../../Utils/dynamic_check.dart");

check(List a) {
  checkTypeError( () {
    try {
      var idx = 0.1;
      a[idx];
      Expect.fail("expected IllegalArgumentException");
    } on IllegalArgumentException catch(ok) {}
  });

  checkTypeError( () {
    try {
      var idx = '23';
      a[idx];
      Expect.fail("expected IllegalArgumentException");
    } on IllegalArgumentException catch(ok) {}
  });

  checkTypeError( () {
    try {
      var idx = false;
      a[idx];
      Expect.fail("expected IllegalArgumentException");
    } on IllegalArgumentException catch(ok) {}
  });
 
}

void main() {
  check(const [null]);
  check(['sd','sd']);
  check(new List.from(<int>[null, 1, 0]));
  check(new List(100));
  check(new List(100));
}
