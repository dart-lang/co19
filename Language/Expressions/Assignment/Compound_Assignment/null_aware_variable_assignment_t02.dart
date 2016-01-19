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
 * if v == null. Test the case when v is prefixed
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';
import 'null_aware_assignment_lib.dart' as lib;

main() {
  lib.v = null;
  lib.v ??= 1;
  Expect.equals(1, lib.v);

  lib.v ??= 2;
  Expect.equals(1, lib.v);
}
