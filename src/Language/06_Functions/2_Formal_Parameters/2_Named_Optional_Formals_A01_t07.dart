/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default values.
 *  defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 *  ;
 * @description Checks that an optional parameter can be constant. Reassigning it should
 * produce a compile-time error.
 * @compile-error
 * @author iefremov
 * @reviewer kaigorodov
 */

foo([const p = 1]) {
  p = 1;
}

main() {
  try {
    foo();
  } catch(var x){}
}