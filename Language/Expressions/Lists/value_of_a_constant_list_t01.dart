/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  The value of a constant list literal  const <E>[e1... en] is an
 * object a that implements the built-in class List<E>. The ith element of a is
 * vi+1, where vi is the value of the compile time expression ei.
 * @description Checks that the value of a constant list literal is an object
 * that implements interface List<E>.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class C {
  const C();
}

main() {
  Expect.isTrue(const <int>[] is List<int>);
  Expect.isTrue(const <int>[1, 2, 3 + 4] is List<int>);
  Expect.isTrue(const <bool>[false, 1 < 2] is List<bool>);
  Expect.isTrue(const <String>["a", "b", "c"] is List<String>);
  Expect.isTrue(const <C>[const C(), const C()] is List<C>);
}
