/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A reference to a static constant variable is a constant expression.
 * @description Checks that a reference to a static constant variable can be an element
 * of a constant list literal and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 * @reviewer msyabro
 * @issue 5832
 */

const x = '';

class C {
  const bool y = false;
}

const constList = const [
  x,
  C.y
];

main() {
  Expect.isTrue(constList is List);
}
