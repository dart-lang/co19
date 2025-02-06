// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a syntax error to use a `new` keyword in the
/// static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  final String value;
  C(this.value);
  const C.foo(this.value);
}

extension type ET(int v) {
  const ET.foo(this.v);
  ET.bar(this.v);
}

main() {
  C c1 = new .new("new");
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  C c2 = new .foo("foo");
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET et1 = new .new(1);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET et2 = new .foo(2);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET et3 = new .bar(3);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
