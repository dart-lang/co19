/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * Passing null as argument results in Error
 * the given collection. 
 * @description Checks that an Error is thrown if the argument is null.
 * Both empty and non-empty Sets are tested.
 * @author rodionov
 * @needsreview Undocumented
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  check(new Set.from([]));
  check(new Set.from([1, 2, 3]));
}

void check(Set s) {
  try {
    s.intersection(null);
    Expect.fail("Error expected");
  } on Error catch(e) {
  }
}
