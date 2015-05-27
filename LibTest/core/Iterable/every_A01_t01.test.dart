/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool every(bool f(E element))
 * Returns true if every elements of this collection satisify the predicate f.
 * Returns false otherwise.
 * @description Check that true is returned only if every element of the list satisfies the predicate [f].
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */
library elementAt_A01_t01;

import "../../../Utils/dynamic_check.dart";
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  List a=create();
  a.addAll([0,1,2,3,4,5,6,7,8,9]);
  Expect.isTrue(a.every((int e) { return (e >= 0 && e < 10); } ));
  Expect.isFalse(a.every((int e) { return (e < 0); } ));

  a = [[],[null], [1,2,3,4], ["string"]];
  Expect.isTrue(a.every((var e) { return (e is List); } ));
  Expect.isFalse(a.every((var e) { return (e is Set); } ));

  a=create();
  a.addAll([1,2,3]);
  bool f (int e) { return (e > 0); }
  Expect.isTrue(a.every(f));

  a.insertAll(0, [-1, -2, -3]);
  try {
    a.every(f);
  } catch(e){
    if(isCheckedMode()) {
      Expect.isTrue(e is TypeError, "Type error expected in checked mode");
    } else {
      Expect.isTrue(e is NoSuchMethodError, "NoSuchMethodError expected in production mode");
    }
  }
}
