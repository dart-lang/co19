/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Every function includes a formal parameter list, which consists
 * of a list of required parameters, followed by any optional parameters.
 * The optional parameters may be specified either as a set of named parameters
 * or as a list of positional parameters, but not both.
 * formalParameterList:
 *   '(' ')' |
 *   '('normalFormalParameters(',' optionalFormalParameters)?')' |
 *   '('optionalFormalParameters')'
 * ;
 * normalFormalParameters:
 *   normalFormalParameter(',' normalFormalParameter)*
 * ;
 * optionalFormalParameters:
 *   optionalPositionalFormalParameters |
 *   namedFormalParameters
 * ;
 * optionalPositionalFormalParameters:
 *  `['defaultFormalParameter(`,' defaultFormalParameter)*`]'
 * ;
 * namedFormalParameters:
 *  `{'defaultNamedParameter(`,' defaultNamedParameter)*`}'
 * ;
 * @description Checks that named parameters can't precede required positional
 * parameters.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 * @reviewer rodionov
 */

f({var a}, var b) {}

main() {
  try {
    f(1, 1);
  } catch (x) {}
}
