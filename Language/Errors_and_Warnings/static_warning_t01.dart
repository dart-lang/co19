/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static warnings are those errors reported by the static checker.
 * They have no effect on execution
 * @description Checks that static warning has no effect on execution
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 27161
 */
import '../../Utils/expect.dart';

main() {
  List l = new List();
  List<int> li = new List<int>();

  li = l; /// static type warning

  Expect.isTrue(true);
}
