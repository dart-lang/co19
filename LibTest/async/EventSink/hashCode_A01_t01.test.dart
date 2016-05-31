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

test(EventSink create()) {
  EventSink es1 = create();
  EventSink es2 = create();
  EventSink es3 = es1;

  if (es1 == es2) {
    Expect.isTrue(es1.hashCode == es2.hashCode);
  } else {
    Expect.isFalse(es1.hashCode == es2.hashCode);
  }
  if (es1 == es3) {
    Expect.isTrue(es1.hashCode == es3.hashCode);
  } else {
    Expect.isFalse(es1.hashCode == es3.hashCode);
  }
}

