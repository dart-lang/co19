// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the cases in a switch expression
/// are not exhaustive
///
/// @description Check that it is a compile-time error if a switch expression is
/// not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test(bool b) => switch (b) {
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  true => "true"
};

main() {
  bool b = 1 > 2;
  var v1 = switch (b) {
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    true => "true"
  };
  String? v2 = switch (b) {
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    true => "true"
  };
  test(true);
}
