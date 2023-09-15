// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The current instance (and hence its members) can only be accessed at
/// specific locations in a class: We say that a location ℓ has access to this
/// iff ℓ is inside the body of a declaration of an instance member or a
/// generative constructor, or in the initializing expression of a late instance
/// variable declaration.
///
/// Note that an initializing expression for a non-late instance variable does
/// not have access to this, and neither does any part of a declaration marked
/// static.
///
/// @description Checks that `this` is accessible in the initializing expression
/// of a late instance variable
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  int x = 0;
  late int Function() f1 = () => this.x;
  late final f2 = () {return this.x;};
  late var f3 = (int i) => i + this.x;
}

main() {
  C c = C();
  Expect.equals(0, c.f1());
  Expect.equals(0, c.f2());
  Expect.equals(1, c.f3(1));
}
