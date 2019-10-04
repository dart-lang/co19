/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 *
 * If element is an expressionElement with expression e1:
 * ...
 * If P is Set<Ps> then the inferred set element type of element is the inferred
 * type of the expression e1 in context Ps.
 *
 * @description Checks that if P is Set<Ps> then the inferred set element type
 * of element is the inferred type of the expression e1 in context Ps.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Set<double> x = {1};
  Expect.setEquals({1.0}, x);
}
