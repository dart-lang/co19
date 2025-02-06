// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We introduce grammar productions of the form:
/// ```
/// <postfixExpression> ::= ...            -- all current productions
///     | <staticMemberShorthand>          -- added production
///
/// <constantPattern> ::=  ...             -- all current productions
///     | <staticMemberShorthandValue>     -- No selectors, no `.new`.
///
/// <staticMemberShorthand> ::= <staticMemberShorthandHead> <selector>*
///
/// <staticMemberShorthandHead> ::=
///       <staticMemberShorthandValue>
///     | '.' 'new'                                       -- shorthand unnamed constructor
///
/// <staticMemberShorthandValue> ::=                      -- something that can potentially create a value.
///     | '.' <identifier>                                -- shorthand for qualified name
///     | 'const' '.' (<identifier> | 'new') <arguments>  -- shorthand for constant object creation
///  ```
///
/// @description Checks that expressions of the form
/// `const '(' '.' id(arguments) ')'` and
/// `const '(' '.' new(arguments) ')'` are still compile-time errors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  final String value;
  const C(this.value);
  const C.id(this.value);
  const factory C.f(String value) = C;
}

extension type const ET(String value) {
  const ET.id(this.value);
  const factory ET.f(String value) = ET;
}

main() {
  const C c1 = const (.new("one"));
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  const C c2 = const (.id("two"));
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  const C c3 = const (.f("three"));
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et1 = const (.new("new"));
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  const ET et2 = const (.id("id"));
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et3 = const (.f("f"));
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
