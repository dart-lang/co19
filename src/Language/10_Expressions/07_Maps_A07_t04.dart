/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime map literal <V>{k1:e1... kn :en}  is evaluated as follows:
 *   First, the expressions e1...en are evaluated in left to right order, yielding objects o1... on.
 *   A fresh instance m that implements the built-in interface Map<String, V> is allocated.
 *   Let ui be the value of the string literal specified by ki.
 * An entry with key ui and value oi is added to m, 0 <= i < n.
 *   The result of the evaluation is m.
 * @description Checks that the result of a runtime map literal <V>{k1:e1... kn :en}
 * is an object that implements interface Map<String, V>.
 * @author msyabro
 * @reviewer rodionov
 */

class C {}

main() {
  Expect.isTrue(<int> {"": 1} is Map<String, int>);
  Expect.isTrue(<String> {"": "string"} is Map<String, String>);
  Expect.isTrue(<bool> {"": true} is Map<String, bool>);
  Expect.isTrue(<C>{"": new C()} is Map<String, C>);
}
