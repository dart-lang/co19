// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Here is an interesting example:
/// ```
/// class C {
///   var _ = 'field';
///
///   test() {
///     var _ = 'local';
///
///     _ = 'assign';
///   }
/// }
/// ```
/// This program is valid and assigns to the field, not the local.
///
/// @description Checks that a local variable named `_` doesn't shadow a
/// top-level variable named `_` but a class field does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _ = "top-level";

test() {
  var _ = "local";
  _ = "assign1";
  Expect.equals("assign1", _);
}

class C {
  var _ = "field";

  void test() {
    var _ = "local";
    Expect.equals("field", _);
    _ = "assign2";
    Expect.equals("assign2", _);
  }
}

main() {
  test();
  Expect.equals("assign1", _);
  C c = C();
  c.test();
  Expect.equals("assign1", _);
  Expect.equals("assign2", c._);
}
