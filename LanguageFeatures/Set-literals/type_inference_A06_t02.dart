/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a mapEntry ek: ev:
 * ...
 * If P is Map<Pk, Pv> then the inferred key type of element is the inferred
 * type of ek in context Pk and the inferred value type of element is the
 * inferred type of ev in context Pv.
 *
 * @description Checks that if P is Map<Pk, Pv> then the inferred key type of
 * element is the inferred type of ek in context Pk and the inferred value type
 * of element is the inferred type of ev in context Pv.
 * @description Checks that if P is Set<Ps> then the inferred set element type
 * of element is the inferred type of the expression e1 in context Ps.
 * @author sgrekhov@unipro.ru
 */
main() {
  Map<double, double> x1 = {1 + 1: 1.0};  //# 01: compile-time error
  Map<double, double> x2 = {1.0: 1 + 1};  //# 02: compile-time error
}
