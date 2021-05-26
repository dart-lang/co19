// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

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
/// @description Checks that parameter declarations must be separated by comma.
/// @author rodionov
/// @reviewer kaigorodov


void f(var p1 [var p2]) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

main () {
  try {
    f(1);
  } catch (x) {}
}
