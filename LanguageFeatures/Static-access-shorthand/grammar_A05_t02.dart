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
/// short syntax with the unary prefix `-` operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  static int get one => 1;
  static int two() => 2;
  static List<int> values = [1];
}

mixin M on C {
  static int get one => 1;
  static int two() => 2;
  static List<int> values = [1];
}
class MC = C with M;

enum E {
  e1;

  static int get one => 1;
  static int two() => 2;
  static List<int> intValues = [1];
}

extension type ET(int v) implements int {
  static int get one => 1;
  static int two() => 2;
  static List<int> values = [1];
}

main() {
  Object o = C();
  if (o is C) {
    o = -.one;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = C();
  if (o is C) {     // ignore: unnecessary_type_check
    o = -.two();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = C();
  if (o is C) {     // ignore: unnecessary_type_check
    o = -.values[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = MC();
  if (o is M) {
    o = -.one;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = MC();
  if (o is M) {     // ignore: unnecessary_type_check
    o = -.two();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = MC();
  if (o is M) {     // ignore: unnecessary_type_check
    o = -.values[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = E.e1;
  if (o is E) {
    o = -.one;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = E.e1;
  if (o is E) {     // ignore: unnecessary_type_check
    o = -.two();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = E.e1;
  if (o is E) {     // ignore: unnecessary_type_check
    o = -.intValues[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = ET(0);
  if (o is ET) {
    o = -.one;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = ET(0);
  if (o is ET) {     // ignore: unnecessary_type_check
    o = -.two();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = ET(0);
  if (o is ET) {     // ignore: unnecessary_type_check
    o = -.values[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
