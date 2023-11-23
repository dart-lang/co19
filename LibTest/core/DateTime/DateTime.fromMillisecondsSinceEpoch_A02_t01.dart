// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DateTime.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch, {bool isUtc: false})
/// Constructs a new DateTime instance with the given millisecondsSinceEpoch.
/// @description Checks that exception is thrown if [millisecondsSinceEpoch] or
/// [isUtc] is set to [null].
/// @author iefremov

import "../../../Utils/expect.dart";

dynamic getNull() => null;

main() {
  Expect.throws(() => DateTime.fromMillisecondsSinceEpoch(getNull(), isUtc: true));
  Expect.throws(() => DateTime.fromMillisecondsSinceEpoch(1, isUtc: getNull()));
}
