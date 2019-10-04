/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [&], [|] and [^] binary operators are now also allowed when
 * the operands are of type [bool].
 * @description Checks that operator [^] is not accepted for constants if the
 * dirst one is of type [bool] and the second is of type [int].
 * @compile-error
 * @author iarkh@unipro.ru
 */

const bool b1 = true;
const int b2 = 0;

main() {
  const c1 = b1 ^ b2;
}
