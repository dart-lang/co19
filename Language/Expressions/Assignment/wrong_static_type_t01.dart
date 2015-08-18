/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as follows:
 * ...
 * Let T be the static type of e1 . It is a static type warning if T does not have
 * an accessible instance setter named v =. It is a static type warning if the static
 * type of e2 may not be assigned to T. The static type of the expression e1 v =
 * e2 is the static type of e2.
 * @description Checks that it is a static type warning if the static type of e2 may not
 * be assigned to the static type of e1.v.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/dynamic_check.dart';

class C {
  int v;
}

main() {
  C c = new C();
  checkTypeError(() {
     c.v = true; /// static type warning
  });
}
