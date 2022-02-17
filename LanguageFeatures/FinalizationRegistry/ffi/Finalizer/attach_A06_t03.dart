// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The finalizer can be attached multiple times to the same object
/// with different, or the same, finalization token.
///
/// @description Checks that finalizer can be attached to the same object with
/// different, or the same, finalization tokens.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

class Nonce {
  final int value;
  Nonce(this.value);
}

final finalizerTokens = <String>{};
int cnt = 0;
final Finalizer finalizer = Finalizer((token) {
  finalizerTokens.add(token);
  cnt++;
});

@pragma('vm:never-inline')
void attachToFinalizer(Nonce token1, token2, token3) {
  Object value = Object();
  finalizer.attach(value, "Token 1", detach: token1);
  finalizer.attach(value, "Token 2", detach: token2);
  finalizer.attach(value, "Token 3", detach: token3);
  finalizer.attach(value, "Token 1", detach: token1);
  finalizer.attach(value, "Token 2", detach: token2);
  finalizer.attach(value, "Token 3", detach: token3);
  finalizer.attach(value, "Token 1", detach: token1);
  finalizer.attach(value, "Token 2", detach: token2);
  finalizer.attach(value, "Token 3", detach: token3);
}

main() async {
  Nonce token1 = Nonce(1);
  Nonce token2 = Nonce(2);
  Nonce token3 = Nonce(3);

  attachToFinalizer(token1, token2, token3);

  await triggerGcWithDelay(repeat: 3);
  Expect.setEquals({"Token 1", "Token 2", "Token 3"}, finalizerTokens);
  Expect.equals(3, cnt);
}
