/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a map literal of the form  const <String, V>{k1:e1... kn :en}
 * or the form <String, V>{k1:e1... kn :en} is Map<String, V>.
 * @description Checks that a static warning occurs when assigning a map literal
 * to a String variable.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

import "../../Utils/dynamic_check.dart";

main() {
  String s;
  checkTypeError( () => s = <String, String> {} );
}
