/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A required formal parameter may be specied in one of three ways:
 *
 * • By means of a function signature that names the parameter and describes
 *   its type as a function type. It is a compile-time error if any default
 *   values are specied in the signature of such a function type.
 * • As an initializing formal, which is only valid as a parameter to a
 *   generative constructor.
 * • Via an ordinary variable declaration
 *
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
 *   metadata finalConstVarOrType? this '.' identifier formalParameterList?
 * ;
 * @description Checks that reassigning a final required parameter inside the
 * function produces a compile error
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 */

func(final x) {
  x = 1;
}

main() {
  func(1);
}
