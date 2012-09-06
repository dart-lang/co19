/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A required formal parameter is a simple variable declaration.
 * normalFormalParameter:
 *   functionSignature |
 *   fieldFormalParameter |
 *   simpleFormalParameter
 * ;
 * simpleFormalParameter:
 *   declaredIdentifier |
 *   metadata identifier
 * ;
 * fieldFormalParameter:
 *   metadata finalConstVarOrType? this '.' identifier
 * ;
 * @description Checks that reassigning a final required parameter produces a compile-time error.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 */

func(final x) {
  x = 1;
}

main() {
  try {
    func(1);
  } catch(e) {}
}
