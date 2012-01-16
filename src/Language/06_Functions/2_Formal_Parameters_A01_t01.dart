/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Every function declaration includes a formal parameter list, which consists of
 * a list of required parameters, followed by any optional parameters. Optional
 * parameters consist of a list of named parameters.
 * formalParameterList:
 *   '(' ')' |
 *   '(' normalFormalParameters ( ',' namedFormalParameters)? ')' |
 *   (namedFormalParameters)
 * ;
 * normalFormalParameters:
 *   normalFormalParameter (', ' normalFormalParameter)*
 * ;
 * namedFormalParameters:
 *   '[' defaultFormalParameter (', ' defaultFormalParameter)* ']'
 * ;
 * @description Checks correct syntax for named parameters.
 * @author msyabro
 * @reviewer kaigorodov
 */

void f(var a, var b, [var c]) {}
void g([var a, var b]) {}
void h([var a]) {}

main() {
  f(1, 1, 1);
  g(1, 1);
  h(1);
}