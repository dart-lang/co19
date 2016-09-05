/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form e1?.v = e2 is ...
 * The static type of a is the static type of e2
 * @description Checks that the static type of e1?.v = e2 is the static type
 * of e2
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/dynamic_check.dart';

class C {
  var v;
}

main() {
  double e = 3.14;
  C c = new C();
  checkTypeError(() {double x = c?.v = e;});
}
