/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s is a set literal, then it has the form
 * const? ('<' type '>')? '{' ... '}' where ... is zero or more comma-separated
 * element expressions (potentially with a trailing comma which is otherwise
 * ignored).
 *
 * @description Checks set literal syntax
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var v1  = const <int> {1, 2, 3,};
  Expect.equals(3, v1.length);
  Expect.iterableEquals(new Set.from([1, 2, 3]), v1);

  var v2  = <int> {1, 2, 3, 4,};
  Expect.equals(4, v2.length);
  Expect.iterableEquals(new Set.from([1, 2, 3, 4]), v2);

  var v3  = {1, 2, 3, 4, 5,};
  Expect.equals(5, v3.length);
  Expect.iterableEquals(new Set.from([1, 2, 3, 4, 5]), v3);

  var v4  = const <int> {1, 2, 3};
  Expect.equals(3, v1.length);
  Expect.iterableEquals(new Set.from([1, 2, 3]), v4);

  var v5  = <int> {1, 2, 3, 4};
  Expect.equals(4, v2.length);
  Expect.iterableEquals(new Set.from([1, 2, 3, 4]), v5);

  var v6  = {1, 2, 3, 4, 5};
  Expect.equals(5, v3.length);
  Expect.iterableEquals(new Set.from([1, 2, 3, 4, 5]), v6);
}
