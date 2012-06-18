/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Checks that an Exception is thrown
 * if any of arguments is invalid.
 * @author varlax
 * @reviewer iefremov
 */

#import("../../../Utils/dynamic_check.dart");

void check(List l, start, length) {
  Expect.throws(() => l.insertRange(start, length));
}

main() {
  check([], '0', 1);
  check([], 0, 0.1);
  check([], 0.1, 1.0 );
  check([], true, false);

  check(const [], '0', 1);
  check(const [], 0, 0.1);
  check(const [], 0.1, 1.0 );
  check(const [], true, false);
  
  check(new List(1), '0', 1);
  check(new List(1), 0, 0.1);
  check(new List(1), 0.1, 1.0 );
  check(new List(1), true, false);

  check(new List(), '0', 1);
  check(new List(), 0, 0.1);
  check(new List(), 0.1, 1.0 );
  check(new List(), true, false);

  check(new List.from([]), '0', 1);
  check(new List.from([]), 0, 0.1);
  check(new List.from([]), 0.1, 1.0 );
  check(new List.from([]), true, false);
}
