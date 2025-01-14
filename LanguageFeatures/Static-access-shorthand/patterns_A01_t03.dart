// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant pattern `<staticMemberShorthandValue>` is treated the
/// same as that static member shorthand as an expression that has no following
/// selectors, except with the matched value type is set as the shorthand
/// context of the `<staticMemberShorthandHead>`.
///
/// The restriction to `<staticMemberShorthandValue>` is intended to match the
/// existing allowed constant patterns, `<qualifiedIdentifier>` and
/// `<constObjectExpression>`, and nothing more, which is why it omits the
/// `.new` which is guaranteed to be a constructor tear-off. The shorthand
/// constant pattern `'.' <identifier>` must satisfy the same restrictions as
/// the `<qualifiedIdentifier>` constant pattern, mainly that it must denote a
/// constant getter.
///
/// @description Checks that it is a compile-time error if for a constant
/// pattern the matched value type has no appropriate member.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  final int value;
  const C(this.value);

  static const C one = C(1);
}

mixin M on C {
  static const M one = MC(1);
}

class MC extends C with M {
  const MC(super.value);
}

main() {
  String res = "";

  switch (MC(1)) {
    case .one:
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
  }

  String res = switch (MC(1)) {
    .one => "M one",
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}
