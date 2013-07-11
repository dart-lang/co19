/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final IsolateStream stream
 * The initial IsolateStream available by default for this isolate.
 * This IsolateStream is created automatically and it is commonly used to establish
 * the first communication between isolates (see streamSpawnFunction and streamSpawnUri).
 * @description Checks that the value returned by this getter is not null and is
 * indeed an instance of IsolateStream.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:isolate";

main() {
  Expect.isTrue(stream != null);
  Expect.isTrue(stream is IsolateStream);
  stream.close();
}
