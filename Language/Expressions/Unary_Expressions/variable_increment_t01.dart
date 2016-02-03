/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an expression of the form ++e is equivalent to
 * e += 1.
 * @description Checks that evaluation of an expression of the form ++e is
 * equivalent to e += 1.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  var v1 = 1;
  var v2 = 1;
  var r1 = ++v1;
  var r2 = (v2 += 1);
  Expect.equals(v1, v2);
  Expect.equals(r1, r2);
}
