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
 * @description Checks correct syntax for specifying optional parameters.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

void f(var a, var b, [var c]) {}
void g([var a, var b]) {}
void h([var a]) {}
void f2(var a, var b, {var c}) {}
void g2({var a, var b}) {}
void h2({var a}) {}

main() {
  f(1, 1, 1);
  g(1, 1);
  h(1);
  f2(1, 1, c:1);
  g2(a:1, b:1);
  h2(a:1);
}
