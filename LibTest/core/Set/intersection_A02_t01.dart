/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract Set<E> intersection(Set<Object> other)
 * Passing null as argument results in Error. 
 * @description Checks that either an Error is thrown or empty Set is returned
 * if the argument is null.
 * Both empty and non-empty Sets are tested.
 * @author rodionov
 */
library intersection_A02_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

void check(Set create([Iterable content]), Set s) {
  var res = new Set.from([1]);
  try {
    res = s.intersection(null);
  } on Error {
    return;
  }
  Expect.isTrue(res.isEmpty);
}

test(Set create([Iterable content])) {
  check(create, create([]));
  check(create, create([1, 2, 3]));
}

main() {
  test(create);
}
