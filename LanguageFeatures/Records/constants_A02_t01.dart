// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record expression is a potentially constant expression if and
/// only if all its field expressions are potentially constant or constant
/// expressions. This means that a record expression can be used in the
/// initializer list of a constant non-redirecting generative constructor, and
/// can depend on constructor parameters.
///
/// @description Checks that a record expression is a potentially constant
/// expression if and only if all its field expressions are potentially constant
/// or constant expressions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

class C {
  final (num, {String name}) r;
  const C(int i, String s): r = (i + 1, name: s + "!");
}

main() {
  const c = const C(42, "Hi");
  Expect.equals(43, c.r.$0);
  Expect.equals("Hi!", c.r.name);
}
