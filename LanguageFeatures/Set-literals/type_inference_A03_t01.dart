/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 *
 * If element is an expressionElement with expression e1:
 *
 * If P is ? then the inferred set element type of element is the inferred type
 * of the expression e1 in context ?.
 *
 * @description Checks that if P is ? then the inferred set element type of
 * element is the inferred type of the expression e1 in context ?
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

void foo<X extends num>(Set<X> s) {
  Expect.isTrue(s is Set<double>);
}

void bar<X extends num>(Set<X> s) {
  Expect.isTrue(s is Set<int>);
}

main() {
  foo<double>({1});
  foo({3 + 3.14, 2.0, 1.1});
  bar({3 + 3, 2, 1});
}
