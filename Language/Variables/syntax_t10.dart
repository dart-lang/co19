// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ⟨finalConstVarOrType⟩ ::= late? final ⟨type⟩?
///   | const ⟨type⟩?
///   | late? ⟨varOrType⟩
///
/// ⟨varOrType⟩ ::= var | ⟨type⟩
///
/// ⟨initializedVariableDeclaration⟩ ::=
///   ⟨declaredIdentifier⟩ (‘=’ ⟨expression⟩)? (‘,’ ⟨initializedIdentifier⟩)*
///
/// ⟨initializedIdentifier⟩ ::= ⟨identifier⟩ (‘=’ ⟨expression⟩)?
///
/// ⟨initializedIdentifierList⟩ ::=
///   ⟨initializedIdentifier⟩ (‘,’ ⟨initializedIdentifier⟩)*
///
/// @description Checks that a non-expression statement cannot be used instead 
/// of expression in an initialized variable declaration.
/// @author iefremov

main() {
  var x = return 0;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
