/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type a map literal of the form const{k1 : e1 . . . kn : en }
 * or the form {k1 : e1 . . . kn : en } is Map <String, dynamic>.
 * @description Checks that a static warning occurs when assigning a map literal
 * with a single int type parameter to a variable with declared type Map<int, int>.
 * @author iefremov
 * @reviewer rodionov
 */

import "../../Utils/dynamic_check.dart";

main() {
  Map<int, int> i;
  checkTypeError( () => 
    i = <String, int> {} /// static type warning 
  );
}
