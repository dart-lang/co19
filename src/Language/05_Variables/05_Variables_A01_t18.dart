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
 * @description Checks that a variable cannot be abstract void.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 */

class C {
  abstract void x = 1;
}

main() {
  try {
    new C();
  } catch(ok) {}
}
