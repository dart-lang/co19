// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the cases in a switch expression
/// are not exhaustive
///
/// @description Check that it is no compile-time error if the cases in a switch
/// expression are exhaustive. Test a matched type which is not an
/// always-exhaustive type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(List<bool> l) => switch (l) {
  [] => "case-0",
  [true, ...] => "case-1",
  [false, ...] => "case-2"
};

String test2(Map<String, bool> m) => switch (m) {
  <String, bool>{} => "case-0",
  {"key1": true} => "case-1",
  {"key1": false} => "case-2",
  {...} => "case-3"
};

main() {
  Expect.equals("case-0", test1([]));
  Expect.equals("case-1", test1([true]));
  Expect.equals("case-1", test1([true, false]));
  Expect.equals("case-2", test1([false]));
  Expect.equals("case-2", test1([false, false]));

  Expect.equals("case-0", test2({}));
  Expect.equals("case-1", test2({"key1": true}));
  Expect.equals("case-3", test2({"key1": true, "key2": false}));
  Expect.equals("case-2", test2({"key1": false}));
  Expect.equals("case-3", test2({"key1": false, "key2": false}));
}
