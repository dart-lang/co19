// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A simple identifier in a matching context is treated as a named constant
/// pattern unless its name is _
///
/// @description Checks that a simple identifier in a matching context is
/// a compile-time error if no constant with the same name defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

var c = 1;

String test1(int x) {
  switch (x) {
    case c:
//       ^
// [analyzer] unspecified
// [cfe] unspecified
      return "match $c";
    default:
      return "no match";
  }
}

String test2(int x) =>
  switch (x) {
    c => "match $c",
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "no match"
  };

String test3(int x) {
  if (x case c) {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    return "match $c";
  }
  return "no match";
}

main() {
  test1(1);
  test2(1);
  test3(1);
}
