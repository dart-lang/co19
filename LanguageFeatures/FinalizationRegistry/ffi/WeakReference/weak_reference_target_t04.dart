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

dynamic d;

@pragma('vm:never-inline')
C? getNullObject() => null;

@pragma('vm:never-inline')
WeakReference<C> createWeakReference() {
  C? c = C(42);
  d = c;
  WeakReference<C> wr = WeakReference(c);
  Expect.equals(c, wr.target);
  c = getNullObject();
  Expect.isNull(c);
  triggerGc();
  Expect.equals(d, wr.target);
  return wr;
}

main() {
  WeakReference<C> wr = createWeakReference();
  triggerGc();
  Expect.equals("C(42)", wr.target.toString());
  d = getNullObject();
  Expect.isNull(d);
  triggerGc();
  Expect.isNull(wr.target);
}
