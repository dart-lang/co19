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
/// @description Checks that it is a compile-time error to use the static access
/// shorthand syntax with the `is!` operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  static C one = C(1);
  int v;
  C(this.v);
}

mixin M on C {
  static M two = MC(2);
}
class MC = C with M;

enum E {
  e1;

  static E one = E.e1;
}

extension type ET(int v) implements int {
  static ET one = ET(1);
}

main() {
  if (.one is! C) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.two is! M) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.one is! E) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.e1 is! E) {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  if (.one is! ET) {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
