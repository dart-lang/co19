/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Furthermore, each qi, 1 <= i <= l, must be a member of the set
 * {pn+1, ..., pn+k} or a static warning occurs.
 * @description Checks that it is a compile error if names of an argument does
 * not match with any name of optional named parameters of a function literal.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  ({p1, p2, p3}) {} (1, 2, p: 3);
}
