/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion variableDeclaration:
 *     declaredIdentiﬁer (‘, ’ identiﬁer)*
 *   ;
 *   declaredIdentiﬁer:
 *     metadata ﬁnalConstVarOrType identiﬁer
 *   ;
 *   ﬁnalConstVarOrType:
 *     ﬁnal type? |
 *     const type? |
 *     varOrType
 *   ;
 *   varOrType:
 *     var |
 *     type
 *   ;
 *   initializedVariableDeclaration:
 *     declaredIdentiﬁer (‘=’ expression)? (‘, ’ initializedIdentiﬁer)*
 *   ;
 *   initializedIdentiﬁer:
 *     identiﬁer (‘=’ expression)?
 *   ;
 *   initializedIdentiﬁerList:
 *     initializedIdentiﬁer (‘, ’ initializedIdentiﬁer)*
 *   ;
 * @description Checks that variable declaration cannot contain 'const', 'final' and 'var' simultaneously.
 * @author msyabro
 * @reviewer iefremov
 * @compile-error
 */

main() {
  try {
    const final var x = 1;
  } catch(ok) {}
}
