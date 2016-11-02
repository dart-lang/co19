/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default
 * values.
 * defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 * ;
 * defaultNamedParameter:
 *   normalFormalParameter (':' expression)?
 * ;
 * @description Checks that it is no error when the the '=' character is used in
 * an optional named parameter declaration.
 * @static-clean
 * @author rodionov
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

foo({var a: 1, var b = 2}) {
  return b;
}

main() {
  Expect.equals(2, foo());
}
