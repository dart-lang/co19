/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified compound assignment identifier OP= rhs is evaluated in a fashion that is equivalent to:
 * identifier = identifier OP rhs
 * @description Check that operator %= works correctly
 * @author msyabro
 * @reviewer pagolubev
 */


void main() {
  var i = 15;
  Expect.isTrue( (i %= 4) == 3);
}
