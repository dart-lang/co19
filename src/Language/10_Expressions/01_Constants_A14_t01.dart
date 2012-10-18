/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form identical(e1 , e2 ) where e1 and e2 are
 * constant expressions and identical() is the predefined dart function that returns
 * true iff its two arguments are the same object.
 * @description Checks that various expressions of the specified forms can be used within
 * the initializer list of a constant constructor and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 * @issue 5214
 */

final constList = const [
  identical("a", "b"),
  !identical(true, false),
  identical("a", false),
  identical(((1 == 2) != ("" == "b")), (false != true)),
  identical(null, ''),
  identical(1, null),
  identical(null, null)
];

main() {
  Expect.isTrue(constList is List);
}
