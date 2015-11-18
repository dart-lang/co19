/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an integer literal is int.
 * @description Checks that a static warning is produced when assigning an
 * integer literal to a typed bool variable.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/dynamic_check.dart';

main() {
  checkTypeError(() {
    bool b = 1; /// static type warning
  });
}
