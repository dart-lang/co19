// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that a switch statement with a value type an extension
/// type with a `Map` as a representation type but which doesn't implement `Map`
/// is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1<K, V>(Map<K, V> _) {}

String test(ET1<bool, bool> m) {
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case {true: true}:
      return "case-1";
    case {true: false}:
      return "case-2";
    case {false: true}:
      return "case-3";
    case {false: false}:
      return "case-4";
    case Map():
      return "other";
  }
}

main() {
  test(ET1({false: true}));
}
