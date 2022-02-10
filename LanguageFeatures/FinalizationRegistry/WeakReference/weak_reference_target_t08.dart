// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion target property
/// T? target
/// The current object weakly referenced by this, if any.
///
/// The value is either the object supplied in the constructor, or null if the
/// weak reference has been cleared.
///
/// @description Check that the value of this property value is either the
/// object supplied in the constructor, or null if the weak reference has been
/// cleared
/// @author sgrekhov@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

class C {
  int id;
  C(this.id);
}

main() {
  C? c = C(42);
  WeakReference<C> wr1 = WeakReference(c);
  WeakReference<C> wr2 = WeakReference(c);
  Expect.equals(c, wr1.target);
  Expect.equals(c, wr2.target);
  triggerGc();
  Expect.equals(c, wr1.target);
  Expect.equals(c, wr2.target);
  c = null;
  triggerGc();
  Expect.isNull(wr1.target);
  Expect.isNull(wr2.target);
}
