// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void detach(
///    Object detachToken
//   )
/// Detaches the finalizer from values attached with [detachToken].
///
/// If the finalizer was attached multiple times to the same value with
/// different detachment keys, only those attachments which used [detachToken]
/// are removed.
///
/// @description Checks that only attachments which used given [detachToken]
/// are removed.
/// @author iarkh@unipro.ru

import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class Nonce {
  final int value;
  Nonce(this.value);
}

final finalizerTokens = <String>{};

final Finalizer finalizer = Finalizer((token) {
  finalizerTokens.add(token);
});

@pragma('vm:never-inline')
void attachAndDetach() {
  Object    object1 = Object();
  Object    object2 = Object();
  List<int> object3 = List.filled(100, 1);
  List      object4 = List.filled(200, "abc");
  Nonce     object5 = Nonce(14);

  Object detachToken1 = Nonce(1);
  Object detachToken2 = Nonce(2);

  finalizer.attach(object1, "object1", detach: detachToken1);
  finalizer.attach(object2, "object2", detach: detachToken2);
  finalizer.attach(object3, "object3", detach: detachToken1);
  finalizer.attach(object4, "object4", detach: detachToken1);
  finalizer.attach(object5, "object5", detach: detachToken2);
  finalizer.detach(detachToken1);
}

main() async {
  attachAndDetach();
  await triggerGcWithDelay();
  Expect.setEquals({"object2", "object5"}, finalizerTokens);
  await triggerGcWithDelay();
  Expect.setEquals({"object2", "object5"}, finalizerTokens);
  await triggerGcWithDelay();
  Expect.setEquals({"object2", "object5"}, finalizerTokens);
}
