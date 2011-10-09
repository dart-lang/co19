/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator === only tests for object identity.
 * @description Checks NaN.
 * @author pagolubev
 * @reviewer iefremov
 */


void main() {
  var x = NaN;
  Expect.isTrue(x === x);
}
