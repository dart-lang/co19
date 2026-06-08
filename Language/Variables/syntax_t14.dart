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
/// @description Checks that variable declaration cannot contain 'const', 
/// 'final' and 'var' simultaneously.
/// @author msyabro

main() {
  const final var x = 1;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
