// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Every function includes a formal parameter list, which consists
/// of a list of required parameters, followed by any optional parameters.
/// The optional parameters may be specified either as a set of named parameters
/// or as a list of positional parameters, but not both.
/// formalParameterList:
///   '(' ')' |
///   '('normalFormalParameters(',' optionalFormalParameters)?')' |
///   '('optionalFormalParameters')'
/// ;
/// normalFormalParameters:
///   normalFormalParameter(',' normalFormalParameter)*
/// ;
/// optionalFormalParameters:
///   optionalPositionalFormalParameters |
///   namedFormalParameters
/// ;
/// optionalPositionalFormalParameters:
///  `['defaultFormalParameter(`,' defaultFormalParameter)*`]'
/// ;
/// namedFormalParameters:
///  `{'defaultNamedParameter(`,' defaultNamedParameter)*`}'
/// ;
/// @description Checks correct syntax for specifying optional parameters.
/// @author msyabro

void f(int a, int b, [int? c]) {}
void g([int? a, int? b]) {}
void h([int? a]) {}
void f2(int a, int b, {int? c}) {}
void g2({int? a, int? b}) {}
void h2({int? a}) {}

main() {
  f(1, 1, 1);
  g(1, 1);
  h(1);
  f2(1, 1, c:1);
  g2(a:1, b:1);
  h2(a:1);
}
