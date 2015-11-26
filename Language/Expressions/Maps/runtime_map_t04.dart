/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime map literal <K, V>{k1: e1...kn: en} is evaluated as
 * follows:
 * • First, the expression ki is evaluated yielding object ui, the ei is
 *   evaluated yielding object oi, for i ∈ 1..n in left to right order, yielding
 *    objects u1; o1 ... un; on.
 * • A fresh instance m whose class implements the built-in class Map<K, V> is
 *   allocated.
 * • The operator []= is invoked on m with first argument ui and second argument
 *   oi, i ∈ 1..n.
 * • The result of the evaluation is m.
 * @description Checks that the result of a runtime map literal
 * <String, V>{k1:e1... kn :en} is an object that implements interface
 * Map<String, V>.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class C {}

main() {
  Expect.isTrue(<String, int>{"": 1} is Map<String, int>);
  Expect.isTrue(<String, String>{"": "string"} is Map<String, String>);
  Expect.isTrue(<String, bool>{"": true} is Map<String, bool>);
  Expect.isTrue(<String, C>{"": new C()} is Map<String, C>);
}
