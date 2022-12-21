// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// patternVariableDeclaration ::= ('final' | 'var') outerPattern '=' expression
///
/// outerPattern                ::= parenthesizedPattern
///                               | listPattern
///                               | mapPattern
///                               | recordPattern
///                               | objectPattern
///
/// @description Check that it is a compile-time error if final variable is
/// assigned twice. Test a map pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class Meta {
  const Meta();
}

main() {
  @Meta()
  final {"key1": a1, "key2": b1} = {"key1": 1, "key2": 2};
  a1 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b1 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final {"key1": int a2, "key2": b2, ...} = {"key1": 1, "key2": 2, "key3": 3};
  a2 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b2 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified

  final <String, int>{"key1": a3, "key2": int b3, ...}
      = {"key1": 1, "key2": 2, "key3": 3};
  a3 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  b3 = 42;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
