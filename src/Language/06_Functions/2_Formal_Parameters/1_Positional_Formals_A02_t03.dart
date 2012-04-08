/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A positional formal parameter is a simple variable declaration.
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
 * @description Checks that a positional parameter can be constant. Reassigning it should
 * produce a compile-time error.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

func(const x) {
  x = 1;
}

main() {
  try {
    func(1);
  } catch(var e) {}
}