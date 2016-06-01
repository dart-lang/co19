/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  int hashCode
 * Get a hash code for this object.
 *
 * All objects have hash codes. Hash codes are guaranteed to be the same for
 * objects that are equal when compared using the equality operator ==. Other
 * than that there are no guarantees about the hash codes. They will not be
 * consistent between runs and there are no distribution guarantees.
 *
 * @description Checks usage of hashCode property.
 * @author ngl@unipro.ru
 */
library hashCode_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(StreamConsumer create()) {
  StreamConsumer sc1 = create();
  StreamConsumer sc2 = create();
  StreamConsumer sc3 = sc1;

  if (sc1 == sc2) {
    Expect.isTrue(sc1.hashCode == sc2.hashCode);
  } else {
    Expect.isFalse(sc1.hashCode == sc2.hashCode);
  }
  if (sc1 == sc3) {
    Expect.isTrue(sc1.hashCode == sc3.hashCode);
  } else {
    Expect.isFalse(sc1.hashCode == sc3.hashCode);
  }
}

