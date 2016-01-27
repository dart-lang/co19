/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e1 may not be assigned
 * to bool.
 * @description Checks that it is a static type warning if the type of e1 may
 * not be assigned to bool.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/dynamic_check.dart';

main() {
  checkTypeError(() {
    "" ? true : false; /// static type warning
  });
}
