// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A positional initializing formal named `_` does still initialize
/// a field named `_` (and you can still have a field with that name):
/// ```
/// class C {
///   var _;
///
///   C(this._); // OK.
/// }
/// ```
/// @description Checks that a positional initializing formal named `_` does
/// still initialize a field named `_`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class C {
  var _;
  C(this._);
}

main() {
  Expect.equals(42, C(42));
}
