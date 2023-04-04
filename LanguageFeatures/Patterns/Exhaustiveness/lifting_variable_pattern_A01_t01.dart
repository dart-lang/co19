// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Variable pattern or identifier pattern: The lifted space union of the static
/// type of the corresponding variable.
///
/// @description Check that a lifted space for a variable pattern is a union of
/// the static type of the corresponding variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../../Utils/expect.dart";

String test1(bool o) {
  switch (o) {
    case bool _b:
      return "exhaustive";
  }
}

String test2(bool o) => switch (o) {
      var v => "exhaustive"
    };

main() {
  Expect.equals("exhaustive", test1(true));
  Expect.equals("exhaustive", test1(false));
  Expect.equals("exhaustive", test2(true));
  Expect.equals("exhaustive", test2(false));
}
