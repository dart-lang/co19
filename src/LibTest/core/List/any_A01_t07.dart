/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that something is thrown if the list is not empty
 * and the argument is null or if the argument is not null, but its type is
 * incompatible with the required function type.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

class A {
  A() {}
}

check(var arg) {
  Expect.throws(() => ["1","2","3"].any(arg));
  Expect.throws(() => const ["1","2","3"].any(arg));
  Expect.throws(() => new List.from(["1","2","3"]).any(arg));

  var a = new List(3);
  a.setRange(0, 3, ["1","2","3"]);
  Expect.throws(() => a.any(arg));

  var b = new List();
  b.addAll(["1","2","3"]);
  Expect.throws(() => b.any(arg));
}
 
main() {
  check(false);
  check(1);
  check("every");
  check([1, 2, 3]);
  check(new A());
}
