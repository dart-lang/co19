// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Constant pattern:
/// i. If the constant has primitive equality, then a space whose type is the
///   type of the constant and with a constant restriction for the given
///   constant value.
/// ii. Else the empty space union.
///
/// @description Check that if a constant have no primitive equality then its
/// lifted space is an empty space
/// @author sgrekhov22@gmail.com

class C {
  final bool v;
  const C(this.v);

  bool operator ==(covariant bool other) => v == other;
}

const _true = C(true);
const _false = C(false);

String test1(bool b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case _true:
      return "true";
    case _false:
      return "false";
  }
}

String test2(bool b) => switch (b) {
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _true => "true",
      _false => "false"
    };

main() {
  test1(true);
  test2(false);
}
