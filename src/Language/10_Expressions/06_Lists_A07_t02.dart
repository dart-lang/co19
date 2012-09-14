/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let list1 = const <V>[e11... e1n] and list2 = const <U>[e21... e2n] be two
 * constant list literals and let the  elements of list1 and list2  evaluate to  o11... o1n
 * and o21... o2n respectively. Iff o1i === o2i for 1 <= i <= n and V = U then list1 === list2.
 * @description Checks that constant lists with different elements or type arguments are not identical.
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  const C(p1): x = p1;
  final x;
}

main() {
  Expect.isFalse(const <String>[] === const <Object>[]);

  //Expect.isFalse(const [1, 2, 1 + 2] === const [1, 2, 4]);
  //Expect.isFalse(const <bool>[false] === const <bool>[false, true]);
  //Expect.isFalse(const ["a", "b", "c"] === const <String>["a", "b", "c"]);
  //Expect.isFalse(const [1, null, const C(1)] === const [1, null, const C(2)]);
}
