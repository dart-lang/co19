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
 * @note see discussion to co19 issue #659
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(new Set.from([]));
  check(new Set.from([1, 2, 3]));
}

void check(Set s) {
  var res=new Set.from([1]);
  try {
    res=s.intersection(null);
  } on Error catch(e) {
    return;
  }
  Expect.isTrue(res.isEmpty);
}
