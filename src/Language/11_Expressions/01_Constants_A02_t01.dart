/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal boolean (11.4) is a constant expression.
 * @description Checks that various literal booleans can be elements of a constant list literal
 * and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final constList = const [
  true,
  false
];

main() {
  Expect.isTrue(constList is List);
}
