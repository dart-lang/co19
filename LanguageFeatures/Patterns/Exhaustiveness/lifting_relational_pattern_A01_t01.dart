// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Relational pattern:
/// The empty space union. Relational patterns
/// don't reliably match any values, so don't help with exhaustiveness.
///
/// @description Check that relational pattern doesn't take part in the
/// calculating of the exhaustiveness
/// @author sgrekhov22@gmail.com

String test1(bool b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case == true:
      return "true";
    case == false:
      return "false";
  }
}

String test2(bool b) => switch (b) {
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      == true => "true",
      == false => "false"
    };

main() {
  test1(true);
  test2(false);
}
