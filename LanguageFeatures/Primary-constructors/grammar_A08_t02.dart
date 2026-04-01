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
/// @description Check that optional parameter of the primary constructor may
/// have metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

const meta = 1;

class C([@meta var int x = 0, @meta int y = 1]);

enum E([@meta final int x = 0, @meta int y = 1]) {
  e0(0, 0);
}

main() {
  Expect.equals(1, C(1, 2).x);
  Expect.equals(0, E.e0.x);
}
