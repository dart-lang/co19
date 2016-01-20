/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A compound assignment of the form C?.v ??= e2 is equivalent to the
 * expression C.v ??= e.
 * @description Checks that in expression of the form C?.v ??= e value is set
 * only if C.v == null. Test the case when C.v is prefixed
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';
import 'null_aware_assignment_lib.dart' as lib;

main() {
  lib.C.v = null;
  lib.C?.v ??= 1;
  Expect.equals(1, lib.C.v);

  lib.C?.v ??= 2;
  Expect.equals(1, lib.C.v);
}
