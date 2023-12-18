// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that a switch statement/expression with map patterns and
/// additional exhaustive pattern can be exhaustive.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

String test1_1(Map<bool, bool> m) =>
  switch (m) {
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
    Map() => "other"
  };

String test1_2(Map<bool, bool> m) =>
  switch (m) {
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
    Map() => "other"
  };

String test2_1(Map<bool, bool> m) {
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

String test2_2(Map<bool, bool> m) {
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
  Expect.equals("other", test1_1(<bool, bool>{}));
  Expect.equals("other", test1_2(<bool, bool>{}));
  Expect.equals("other", test2_1(<bool, bool>{}));
  Expect.equals("other", test2_2(<bool, bool>{}));
  Expect.equals("case-1", test1_1({true: true, false: false}));
  Expect.equals("case-2", test1_2({true: false, false: false}));
  Expect.equals("case-1", test2_1({false: true, true: true}));
  Expect.equals("case-1", test2_2({false: false, true: true}));
}
