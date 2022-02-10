// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The finalizer can be attached multiple times to the same object
/// with different, or the same, finalization token.
///
/// @description Checks that finalizer can be attached to the same object with
/// the different finalization tokens.
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

class Nonce {
  final int value;
  Nonce(this.value);
}

final finalizerTokens = <Nonce>{};

final Finalizer finalizer = Finalizer((token) {
  finalizerTokens.add(token);
});

main() async {
  Nonce token = Nonce(1);
  {
    Object value = Object();
    finalizer.attach(value, "Finalization token", detach: token);
    finalizer.attach(value, "Finalization token", detach: token);
    finalizer.attach(value, "Finalization token", detach: token);
  }

  await triggerGcWithDelay();
  Expect.setEquals({token}, finalizerTokens);
}
