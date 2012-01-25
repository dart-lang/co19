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
 * @description Checks that expression after '=' is a must.
 * @compile-error
 * @author iefremov
 */

f([var x = ]) {}

main() {
  try {
    f();
  } catch(var x){}
}