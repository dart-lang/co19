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

import "dart:async";
import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class C {
  int id;
  C(this.id);

  String toString() => "C($id)";
}

@pragma('vm:never-inline')
WeakReference<C> createWeakReference() {
  C c = C(42);
  WeakReference<C> wr = WeakReference(c);
  Future<C>.delayed(Duration(milliseconds: 10), () => c);
  return wr;
}

@pragma('vm:never-inline')
void checkReference(WeakReference<C> ref) {
  C? c = ref.target;
  Expect.isTrue(c == null || c.toString() == "C(42)");
}

main() async {
  WeakReference<C> wr = createWeakReference();
  checkReference(wr);
  await Future.delayed(Duration(seconds: 1));
  triggerGc();
  Expect.isNull(wr.target);
}
