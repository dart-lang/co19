// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Does not work on numbers, strings, booleans, null,
/// dart:ffi pointers, dart:ffi structs, or dart:ffi unions.
/// @description Checks that [Expando] does not work on numbers, strings and
/// booleans
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

main() {
  Expando<int> exp = Expando("C");
  Expect.throws(() {exp[1] = 42;});
  Expect.throws(() {exp["String"] = 42;});
  Expect.throws(() {exp[true] = 42;});
}
