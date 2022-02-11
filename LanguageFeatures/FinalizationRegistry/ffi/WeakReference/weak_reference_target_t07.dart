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

import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class C {
  int id;
  C(this.id);
}

main() {
  C? c1 = C(42);
  C? c2 = c1;
  WeakReference<C> wr = WeakReference(c1);
  Expect.equals(c1, wr.target);
  triggerGc();
  Expect.equals(c1, wr.target);
  c1 = null;
  triggerGc();
  Expect.isNotNull(wr.target);
  Expect.equals(c2, wr.target);
  c2 = null;
  triggerGc();
  Expect.isNull(wr.target);
}
