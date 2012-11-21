/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * Throws Error if one of elements of [other] is null
 * @description Checks that Error is thrown.
 * @author msyabro
 */

checkNPE(var s, var collection) {
  try {
    s.intersection(collection);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}

main() {
  checkNPE(new Set.from([1, 2, 3, 4]), [null]);
  checkNPE(new Set.from([1, 2, 3, 4]), [null, 1]);
}
