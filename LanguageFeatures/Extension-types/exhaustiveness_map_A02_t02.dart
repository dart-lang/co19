// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that a switch statement with a value type an extension
/// type with a `Map` as a representation type is exhaustive if there is `Map()`
/// or a wildcard case
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET<K, V>(Map<K, V> _) {}

String test1(ET<bool, bool> m) {
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

String test2(Map<bool, bool> m) {
  switch (m) {
    case {true: true}:
      return "case-1";
    case {true: false}:
      return "case-2";
    case {false: true}:
      return "case-3";
    case {false: false}:
      return "case-4";
    case ET _:
      return "other";
  }
}

main() {
  test1(ET({false: true}));
  test2({false: true});
}
