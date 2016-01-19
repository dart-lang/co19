/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a compound assignment of the form v ??= e is
 * equivalent to the evaluation of the expression
 * ((x) => x == null ? v = e : x)(v) where x is a fresh variable that is not
 * used in e
 * @description Checks that in expression of the form v ??= e value is set only
 * if v == null
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

main() {
  var v = null;
  v ??= 1;
  Expect.equals(1, v);

  v ??= 2;
  Expect.equals(1, v);
}
