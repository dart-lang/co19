/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a mapEntry ek: ev:
 * If P is ? then the inferred key type of element is the inferred type of ek in
 * context ? and the inferred value type of element is the inferred type of ev
 * in context ?.
 *
 * @description Checks that if P is ? then the inferred key type of element is
 * the inferred type of ek in context ? and the inferred value type of element
 * is the inferred type of ev in context ?.
 * @author sgrekhov@unipro.ru
 */

import "../../Utils/expect.dart";

void foo<K extends num, V extends num>(Map<K, V> m) {
  Expect.isTrue(m is Map<double, int>);
}

main() {
  foo<double, int>({1: 1});
  foo({3 + 3.14: 1 + 1, 2.0: 1 + 1});
}
