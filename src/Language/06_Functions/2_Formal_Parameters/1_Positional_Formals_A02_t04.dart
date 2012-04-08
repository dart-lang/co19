/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A positional formal parameter is a simple variable declaration
 * normalFormalParameter:
 *   functionSignature |
 *   fieldFormalParameter |
 *   simpleFormalParameter
 * ;
 * simpleFormalParameter:
 *   declaredIdentifier |
 *   identifier
 * ;
 * fieldFormalParameter:
 *   finalConstVarOrType? this '.' identifier
 * ;
 * @description Checks that static variable declaration can't be a positional parameter
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

f(static var x) {}

main() {
  try {
    f(1);
  } catch(var x){}
}