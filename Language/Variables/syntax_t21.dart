/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion variableDeclaration:
 *     declaredIdentifier (‘, ’ identifier)*
 *   ;
 *   declaredIdentifier:
 *     metadata finalConstVarOrType identifier
 *   ;
 *   finalConstVarOrType:
 *     final type? |
 *     const type? |
 *     varOrType
 *   ;
 *   varOrType:
 *     var |
 *     type
 *   ;
 *   initializedVariableDeclaration:
 *     declaredIdentifier (‘=’ expression)? (‘, ’ initializedIdentifier)*
 *   ;
 *   initializedIdentifier:
 *     identifier (‘=’ expression)?
 *   ;
 *   initializedIdentifierList:
 *     initializedIdentifier (‘, ’ initializedIdentifier)*
 *   ;
 * @description Checks that only assignment operator is admitted when 
 * variable is initialized.
 * @compile-error
 * @author hlodvig
 * @reviewer iefremov
 */

main() {
  try {
    var x++;
  } catch (ok) {}
}
