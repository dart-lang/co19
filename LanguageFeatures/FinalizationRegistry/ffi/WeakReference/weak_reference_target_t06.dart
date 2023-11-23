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
Future<WeakReference> createWeakReference() async {
  C? c1 = C(42);
  WeakReference<C> wr = WeakReference(c1);
  asyncStart();
  Future<C?>.delayed(Duration(milliseconds: 1), () => c1).then((C? c2) async {
    Expect.equals(c1, wr.target);
    triggerGc();
    Expect.equals(c1, wr.target);
    // Need to be sure that indeed c2 is null and the code is not optimized
    c2 = getNullObject();
    Expect.isNull(c2);
    triggerGc();
    Expect.equals(c1, wr.target);
    asyncEnd();
  });
  Expect.equals(c1, wr.target);
  return wr;
}

main() async {
  WeakReference wr = await createWeakReference();
  await Future.delayed(Duration(seconds: 1));
  triggerGc();
  Expect.isNull(wr.target);
}
