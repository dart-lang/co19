// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that a switch statement/expression with map patterns and
/// additional exhaustive pattern can be exhaustive. Test the case when a
/// matched type is an extension type with a `Map` as a representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET1<K, V>(Map<K, V> _) {}
extension type ET2<K, V>(Map<K, V> _) implements Map<K, V> {}

String test1_1(ET1<bool, bool> m) =>
  switch (m) {
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
    Map() => "other"
  };

String test1_2(ET2<bool, bool> m) =>
  switch (m) {
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
    Map() => "other"
  };

String test2_1(ET1<bool, bool> m) {
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

String test2_2(ET2<bool, bool> m) {
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
  Expect.equals("case-1", test1_1(ET1({true: true})));
  Expect.equals("case-2", test1_2(ET2({true: false})));
  Expect.equals("case-3", test2_1(ET1({false: true})));
  Expect.equals("case-4", test2_2(ET2({false: false})));
  Expect.equals("other", test1_1(ET1<bool, bool>({})));
  Expect.equals("other", test1_2(ET2<bool, bool>({})));
  Expect.equals("other", test2_1(ET1<bool, bool>({})));
  Expect.equals("other", test2_2(ET2<bool, bool>({})));
  Expect.equals("other", test1_1(ET1({true: true, false: false})));
  Expect.equals("other", test1_2(ET2({true: false, false: false})));
  Expect.equals("other", test2_1(ET1({false: true, true: true})));
  Expect.equals("other", test2_2(ET2({false: false, true: true})));
}
