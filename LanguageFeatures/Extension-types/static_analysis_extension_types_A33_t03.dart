// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V is always-exhaustive if and only if its
/// instantiated representation type is always-exhaustive.
///
/// @description Check that an extension type is not always-exhaustive if its
/// representation type is not always-exhaustive but adding an exhaustive case
/// removes a compile-time error
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

extension type IntET(int i) {}

String test1(IntET v) =>
    switch (v) {
      IntET(i: 1) => "1",
      IntET(i: 2) => "2",
      int() => "any"
    };

String test2(IntET v) =>
  switch (v) {
    IntET(i: 1) => "1",
    IntET(i: 2) => "2",
    IntET _ => "any"
  };

main() {
  Expect.equals("1", test1(IntET(1)));
  Expect.equals("2", test1(IntET(2)));
  Expect.equals("any", test1(IntET(3)));
  Expect.equals("1", test2(IntET(1)));
  Expect.equals("2", test2(IntET(2)));
  Expect.equals("any", test2(IntET(3)));
}
