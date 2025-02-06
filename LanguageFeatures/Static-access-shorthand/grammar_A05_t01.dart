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
/// shorthand syntax with the prefix `!` operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  static bool get getterTrue => true;
  static bool methodTrue() => true;
  static List<bool> values = [true];
}

mixin M on C {
  static bool get getterTrue => true;
  static bool methodTrue() => true;
  static List<bool> values = [true];
}
class MC = C with M;

enum E {
  e1;

  static bool get getterTrue => true;
  static bool methodTrue() => true;
  static List<bool> boolValues = [true];
}

extension type ET(int v) implements int {
  static bool get getterTrue => true;
  static bool methodTrue() => true;
  static List<bool> values = [true];
}

main() {
  Object o = C();
  if (o is C) {
    o = !.getterTrue;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = C();
  if (o is C) {     // ignore: unnecessary_type_check
    o = !.methodTrue();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = C();
  if (o is C) {     // ignore: unnecessary_type_check
    o = !.values[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = MC();
  if (o is M) {
    o = !.getterTrue;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = MC();
  if (o is M) {     // ignore: unnecessary_type_check
    o = !.methodTrue();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = MC();
  if (o is M) {     // ignore: unnecessary_type_check
    o = !.values[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = E.e1;
  if (o is E) {
    o = !.getterTrue;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = E.e1;
  if (o is E) {     // ignore: unnecessary_type_check
    o = !.methodTrue();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = E.e1;
  if (o is E) {     // ignore: unnecessary_type_check
    o = !.boolValues[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  o = ET(0);
  if (o is ET) {
    o = !.getterTrue;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = ET(0);
  if (o is ET) {     // ignore: unnecessary_type_check
    o = !.methodTrue();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  o = ET(0);
  if (o is ET) {     // ignore: unnecessary_type_check
    o = !.values[0];
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
