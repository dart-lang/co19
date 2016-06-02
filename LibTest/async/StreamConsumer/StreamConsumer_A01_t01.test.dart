/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamConsumer()
 *
 * @description Checks that an istance of StreamConsumer may be created.
 * @author ngl@unipro.ru
 */
library StreamConsumer_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(StreamConsumer create()) {
  StreamConsumer sc = create();

  Expect.isTrue(sc is StreamConsumer);
}

