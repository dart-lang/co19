/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function literal is an object that encapsulates an executable
 * unit of code.
 * functionExpression:
 *   formalParameterList functionExpressionBody
 * ;
 * @description Checks that identifier can be omitted as long as the return
 * type is omitted as well.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  () {};
  () => null;
  (int p1, double p2) {return 1;};
  (String s, [bool b]) => [];
}
