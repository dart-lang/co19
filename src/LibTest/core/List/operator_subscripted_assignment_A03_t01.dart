/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [ArgumentError] if [index] is [:null:] or invalid.
 * @description Checks that the exception is thrown, for fixed size and growable arrays.
 * @author varlax
 * @reviewer msyabro
 * @needsreview issue 3223
 */

#import("../../../Utils/dynamic_check.dart");

void check(List a) {
  try {
    a[null] = new Object();
    Expect.fail("expected ArgumentError");
  } on ArgumentError catch(ok) {}

  checkTypeError( () {
    try {
      var idx = '0';
      a[idx] = new Object();
      Expect.fail("expected ArgumentError");
    } on ArgumentError catch(ok) {}
  });

  checkTypeError( () {
    try {
      var idx = 2.1;
      a[idx] = new Object();
      Expect.fail("expected ArgumentError");
    } on ArgumentError catch(ok) {}
  });

  checkTypeError( () {
    try {
      var idx = a;
      a[idx] = new Object();
      Expect.fail("expected ArgumentError");
    } on ArgumentError catch(ok) {}
  });
}

main() {
  check([]);
  //check(const []);
  check(new List());
  check(new List(123));
  check(new List.from([1]));
  check(new List.from([null,null,null,null]));
}
