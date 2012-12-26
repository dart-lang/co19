/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Each qi, 1 <= i <= l, must be a member of the set {pm+1, ... , pn+k}
 * or a static warning occurs.
 * @description Checks that it is a static warning if names of an argument does not
 * match with any name of optional named parameters of a top-level function.
 * @author msyabro
 * @reviewer iefremov
 */

func([p1, p2, p3]) {}

main() {
  try {
    func(1, 2, p: 3); /// static type warning
  } catch(e) {}
}
