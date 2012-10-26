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
 * @description Checks that it is a compile-time error if the right-hand expression is missing
 * in an initialized variable declaration.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

main() {
  try {
    var x =;
  } catch(ok) {}
}
