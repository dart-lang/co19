/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  The value of a constant list literal  const <E>[e1... en] is an
 * object a that implements the built-in class List<E>. The ith element of a is
 * vi+1, where vi is the value of the compile time expression ei.
 * @description Checks that the resulted object contains correct elements.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  List l = const[1, 2, 3, 4, 5, 5 + 1, 5 + 2, 9 - 1, 9, 2 * 5];
  for (int i = 0; i < 10; i++) {
    Expect.equals(i + 1, l[i]);
  }

  l = const<bool>[false, true];
  Expect.equals(false, l[0]);
  Expect.equals(true, l[1]);

  l = const[];
  Expect.isTrue(l.isEmpty);

  l = const ["a", "b", "c"];
  Expect.equals("a", l[0]);
  Expect.equals("b", l[1]);
  Expect.equals("c", l[2]);
}
