/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E current
 * Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author kaigorodov
 */
library current_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterator create([Iterable content]), {bool isSet: false}) {

  void checkNext(Iterator it, Iterable a) {
    if (isSet) {
      Set set = new Set.from(a);
      while (it.moveNext()) {
        Expect.isTrue(set.contains(it.current));
        set.remove(it.current);
      }
      Expect.isTrue(set.isEmpty);
    } else {
      var i = 0;
      while (it.moveNext()) {
        Expect.identical(it.current, a.elementAt(i++));
      }
    }
  }

  checkNext(create([null, 0, 1]), [null, 0, 1]);
  checkNext(create(const [null, 0, 1]), const [null, 0, 1]);

  List lst = new List(17495);
  for (var i = 0; i < lst.length; i++) {
    lst[i] = lst.length - i;
  }
  checkNext(create(lst), lst);
  checkNext(create([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, null]),
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, null]);
}
