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
/// @issue 48391

import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class C {
  int id;
  C(this.id);

  String toString() => "C($id)";
}

C? c1;

@pragma('vm:never-inline')
WeakReference<C> createWeakReference() {
  C? c2 = C(42);
  c1 = c2;
  WeakReference<C> wr = WeakReference(c2);
  Expect.equals(c2, wr.target);
  c2 = null;
  triggerGc();
  Expect.isNotNull(wr.target);
  Expect.equals(c1, wr.target);
  return wr;
}

main() {
  WeakReference<C> wr = createWeakReference();
  triggerGc();
  Expect.isNotNull(wr.target);
  c1 = C(-1);
  triggerGc();
  Expect.isNull(wr.target);
}
