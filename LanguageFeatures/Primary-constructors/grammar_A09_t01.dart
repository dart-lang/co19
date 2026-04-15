// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion <declaringParameterList> ::= // New rule.
///      '(' ')'
///    | '(' <declaringFormalParameters> ','? ')'
///    | '(' <declaringFormalParameters> ','
///          <optionalOrNamedDeclaringFormalParameters> ')'
///    | '(' <optionalOrNamedDeclaringFormalParameters> ')';
///
/// <declaringFormalParameters> ::= // New rule.
///      <declaringFormalParameter> (',' <declaringFormalParameter>)*;
///
/// <declaringFormalParameter> ::= // New rule.
///      <metadata> <declaringFormalParameterNoMetadata>;
///
/// <declaringFormalParameterNoMetadata> ::= // New rule.
///      <declaringFunctionFormalParameter>
///    | <fieldFormalParameter>
///    | <declaringSimpleFormalParameter>
///    | <superFormalParameter>;
///
/// <declaringFunctionFormalParameter> ::= // New rule.
///      'covariant'? ('var' | 'final')? <type>?
///      <identifier> <formalParameterPart> '?'?;
///
/// <declaringSimpleFormalParameter> ::= // New rule.
///      'covariant'? ('var' | 'final')? <type>? <identifier>;
///
/// <optionalOrNamedDeclaringFormalParameters> ::= // New rule.
///      <optionalPositionalDeclaringFormalParameters>
///    | <namedDeclaringFormalParameters>;
///
/// <optionalPositionalDeclaringFormalParameters> ::= // New rule.
///      '[' <defaultDeclaringFormalParameter>
///      (',' <defaultDeclaringFormalParameter>)* ','? ']';
///
/// <defaultDeclaringFormalParameter> ::= // New rule.
///      <declaringFormalParameter> ('=' <expression>)?;
///
/// <namedDeclaringFormalParameters> ::= // New rule.
///      '{' <defaultDeclaringNamedParameter>
///      (',' <defaultDeclaringNamedParameter>)* ','? '}';
///
/// <defaultDeclaringNamedParameter> ::= // New rule.
///      <metadata> 'required'? <declaringFormalParameterNoMetadata>
///      ('=' <expression>)?;
///
/// @description Check that required parameters of the primary constructor may
/// have trailing comma.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1(int x,) {
  int x;
  this: x = x;
}

class C2(var int x,);

enum E1(int x,) {
  e0(1);
  final int x;
  this: x = x;
}

enum E2(final int x,) {
  e0(2);
}

extension type ET(int x,);

main() {
  Expect.equals(1, C1(1).x);
  Expect.equals(2, C2(2).x);
  Expect.equals(1, E1.e0.x);
  Expect.equals(2, E2.e0.x);
  Expect.equals(3, ET(3).x);
}
