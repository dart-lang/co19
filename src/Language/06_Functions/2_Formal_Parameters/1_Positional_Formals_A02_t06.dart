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
 * @description Checks that a functionSignature parameter cannot be final.
 * @compile-error
 * @author kaigorodov
 */

func(final x()) {
  return x();
}

main() {
  try {
    func((){});
  } catch(var e) {}
}