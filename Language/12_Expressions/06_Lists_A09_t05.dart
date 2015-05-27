/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a list literal of the form
 * const <E>[e1... en]  or the form <E>[e1... en] is List<E>.
 * @description Checks that a static warning occurs when assigning a const list literal
 * with int type parameter to a variable with declared type List<String>.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

import "../../Utils/dynamic_check.dart";

main() {
  List<String> s;
  checkTypeError(
    () {
      s = const <int>[1, 2, 3]; /// static type warning 
    }
  );
}
