/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * If this is empty throws a StateError.
 * @description Checks that StateError is thrown if the list is empty.
 * @author kaigorodov
 */
library last_A02_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  check(Iterable a) {
    Expect.throws(() {
        create(a).last;
      },
      (e)=> e is StateError
    );
  }

  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
}
