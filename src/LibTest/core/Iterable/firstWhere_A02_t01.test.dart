/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E firstWhere(bool test(E value), {E orElse()})
 * If none matches, the result of invoking the orElse function is returned.
 * @description Checks that the result of invoking the orElse function is returned
 * when none matches.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

class TestException {}

check(List list) {
  Expect.throws(() {
      list.firstWhere((int value)=>false, orElse: (){throw new TestException();});
    },
    (e)=> e is TestException
  );
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
  check([1,2,3]);
}
