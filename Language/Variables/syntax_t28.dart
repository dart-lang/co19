// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a syntax error if a `late` modifier appears
/// after the type.
/// @author sgrekhov22@gmail.com

int late x = 0;
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static int late x = 0;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int late y = 0;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int late x = 0;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int late y = 0;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static int late x = 0;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  int late y = 0;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static int late x = 0;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static int late x = 0;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
