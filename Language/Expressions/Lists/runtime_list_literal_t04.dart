/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime list literal <E>[e1... en] is evaluated as follows:
 * • First, the expressions e1... en are evaluated in order, they appear in the
 *   program, yielding objects o1... on.
 * • A fresh instance a, of size n, whose class implements the built-in class
 *   List<E> is allocated.
 * • The operator []= is invoked on a with first argument i and second argument
 *   oi+1, 0 <= i < n.
 * • The result of the evaluation is a.
 * @description Checks that the result of evaluation is an object that
 * implements interface List<E>.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class C {}

main() {
  Expect.isTrue(<int>[] is List<int>);
  Expect.isTrue(<int>[1, 2, 3 + 4] is List<int>);
  Expect.isTrue(<bool>[false, 1 < 2] is List<bool>);
  Expect.isTrue(<String>["a", "b", "c"] is List<String>);
  Expect.isTrue(<C>[new C(), new C()] is List<C>);
}
