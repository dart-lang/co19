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
C? getNullObject() => null;

@pragma('vm:never-inline')
WeakReference createWeakReference() {
  final C c1 = C(42);
  WeakReference<C> wr = WeakReference(c1);
  asyncStart();
  Future<C?>.delayed(Duration(milliseconds: 1), () => c1).then((C? c2) async {
    Expect.equals(c2, wr.target);
    triggerGc();
    Expect.isNotNull(wr.target);
    return null;
  }).then((value) {
    triggerGc();
    // We cannot be sure that the weakref gets cleared, because the closure
    // capturing c1 can still be alive.
    asyncEnd();
  });
  Expect.equals(c1, wr.target);
  return wr;
}

main() async {
  WeakReference wr = createWeakReference();
  triggerGc();
  // Run first to completion, the delayed function still hold on to the object.
  Expect.equals("C(42)", wr.target.toString());
}
