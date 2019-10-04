/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 * ...
 * If P is Set<Ps> then let S be the inferred type of e1 in context Iterable<Ps>:
 * ...
 * If S is dynamic, then the inferred set element type of element is dynamic.
 *
 * @description Checks that if S is dynamic, then the inferred set element type
 * of element is dynamic.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

test(x) {
  Set<int> s = {...x};
  Expect.isTrue(s is Set<int>);
}

main() {
  dynamic d = [1, 2, 3, 4];
  test(d);
}
