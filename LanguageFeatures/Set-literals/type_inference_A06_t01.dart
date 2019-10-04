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
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Map<double, double> x = {1: 1};
  Expect.mapEquals({1.0: 1.0}, x);
}
