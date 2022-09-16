// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The Enum class behaves as if it was declared as:
///
/// class Enum {
///   // No default constructor.
///   external int get index;
///   external String toString();
/// }
/// We intend to (at least pretend to) let enum classes extend Enum, and let
/// mixins and members access the default index and toString() through super..
/// (In practice, we may use a different class implementing Enum as the
/// superclass, but for checking the validity of super.index/super.toString(),
/// we analyze against Enum itself, so it must have non-abstract
/// implementations.)
///
/// This all makes it look as if Enum would be a valid superclass for the mixin
/// applications and methods of the enhanced enum class.
///
/// @description Check `index` and `toString()` members
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2,
  e3
}

main() {
  Expect.equals(0, E1.e1.index);
  Expect.equals(1, E1.e2.index);
  Expect.equals(2, E1.e3.index);
  Expect.equals("E1.e1", E1.e1.toString());
  Expect.equals("E1.e2", E1.e2.toString());
  Expect.equals("E1.e3", E1.e3.toString());
}
