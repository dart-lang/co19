// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void detach(
///    Object detachToken
//   )
/// Detaches the finalizer from values attached with [detachToken].
///
/// Each attachment between this finalizer and a value, which was created by
/// calling [attach] with the [detachToken] object as [detach] argument, is
/// removed.
///
/// @description Checks that all attacments for the given token get removed
/// after the [detach] call.
/// @author iarkh@unipro.ru

import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class Nonce {
  final int value;
  Nonce(this.value);
}

final finalizerTokens = <Nonce>{};

final Finalizer finalizer = Finalizer((token) {
  finalizerTokens.add(token);
});

@pragma('vm:never-inline')
void test() {
  Object    object1 = Object();
  Object    object2 = Object();
  List<int> object3 = List.filled(100, 1);
  List      object4 = List.filled(200, "abc");
  Nonce     object5 = Nonce(14);

  Object finalizationToken = Nonce(1);

  finalizer.attach(object1, "object1", detach: finalizationToken);
  finalizer.attach(object2, "object2", detach: finalizationToken);
  finalizer.attach(object3, "object3", detach: finalizationToken);
  finalizer.attach(object4, "object4", detach: finalizationToken);
  finalizer.attach(object5, "object5", detach: finalizationToken);
  finalizer.detach(finalizationToken);
}

main() async {
  test();
  await triggerGcWithDelay();
  Expect.setEquals({}, finalizerTokens);
  await triggerGcWithDelay();
  Expect.setEquals({}, finalizerTokens);
  await triggerGcWithDelay();
  Expect.setEquals({}, finalizerTokens);
}
