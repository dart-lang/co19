// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A runtime list literal <E>[e1... en] is evaluated as follows:
/// • First, the expressions e1... en are evaluated in order, they appear in the
///   program, yielding objects o1... on.
/// • A fresh instance a, of size n, whose class implements the built-in class
///   List<E> is allocated.
/// • The operator []= is invoked on a with first argument i and second argument
///   oi+1, 0 <= i < n.
/// • The result of the evaluation is a.
/// @description Checks that the result of evaluation is an object that
/// implements interface List<E>.
/// @author msyabro

import '../../../Utils/expect.dart';

class C {}

main() {
  checkType(checkIs<List<int>>, true, <int>[]);
  checkType(checkIs<List<int>>, true, <int>[1, 2, 3 + 4]);
  checkType(checkIs<List<bool>>, true, <bool>[false, 1 < 2]);
  checkType(checkIs<List<String>>, true, <String>["a", "b", "c"]);
  checkType(checkIs<List<C>>, true, <C>[new C(), new C()]);
}
