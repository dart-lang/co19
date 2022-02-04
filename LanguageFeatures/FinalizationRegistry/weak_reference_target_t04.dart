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

import "gc_utils_lib.dart";
import "../../Utils/expect.dart";

class C {
  int id;
  C(this.id);
}

main() async {
  C? c = C(42);
  dynamic d = c;
  WeakReference<C> wr = WeakReference(c);
  Expect.equals(c, wr.target);
  c = null;
  triggerGc();
  await Future.delayed(Duration(milliseconds: 1));
  Expect.isNotNull(wr.target);
  Expect.equals(d, wr.target);
  d = 42;
  triggerGc();
  await Future.delayed(Duration(milliseconds: 1));
  Expect.isNull(wr.target);
}
