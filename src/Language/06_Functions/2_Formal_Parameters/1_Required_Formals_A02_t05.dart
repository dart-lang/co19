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
 * @description Checks that reassigning a final required parameter inside the function
 * produces a static warning and a NoSuchMethodError.
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 * @issue 5885
 */

func(final x) {
  try {
    x = 1; /// static type warning cannot assign value to final variable
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  func(1);
}
