/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion null is a constant expression.
 * @description Checks that null can be an element of a constant list literal
 * and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 */

final constList = const [null];

main() {
  Expect.isTrue(constList is List);
}
