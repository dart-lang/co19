// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion FormatException([String message = "", dynamic source, int offset])
/// Creates a new FormatException with an optional error message.
/// @description Checks that exception is thrown if [message] is [:null:].
/// @author iarkh

// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

dynamic getNull() => null;

main() {
  Expect.throws(() { FormatException(getNull()); });
}
