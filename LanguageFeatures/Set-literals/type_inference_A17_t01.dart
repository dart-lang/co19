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
 * If P is Map<Pk, Pv> then let S be the inferred type of e1 in context P:
 * ...
 * If S is dynamic, then the inferred key type of element is dynamic, and the
 * inferred value type of element is dynamic.
 * @description Checks that if S is dynamic, then the inferred set element type
 * of element is dynamic.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

test(x) {
  Map<int, String> m = {...x};
  Expect.isTrue(m is Map<int, String>);
}

main() {
  dynamic d = {1: "1", 2: "2", 3: "3", 4: "4"};
  test(d);
}
