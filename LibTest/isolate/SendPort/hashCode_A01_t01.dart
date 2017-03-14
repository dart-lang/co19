/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an immutable hash code for this send port that is
 * consistent with the == operator.
 *
 * @description Checks that [hashCode] is consistent with operator ==.
 *
 * @author msyabro
 */
import "../../../Utils/expect.dart";

import "dart:isolate";

void main() {
  ReceivePort r1 = new ReceivePort();
  ReceivePort r2 = new ReceivePort();
  
  SendPort s1 = r1.sendPort;
  SendPort s2 = r2.sendPort;
  SendPort s3 = r2.sendPort;

  Expect.isFalse(s1 == s2);
  Expect.isTrue(s2 == s3);
  Expect.equals(s2.hashCode, s3.hashCode);

  r1.close();
  Expect.isFalse(s1 == s2);
  Expect.isTrue(s2 == s3);
  Expect.equals(s2.hashCode, s3.hashCode);

  r2.close();
  Expect.isFalse(s1 == s2);
  Expect.isTrue(s2 == s3);
  Expect.equals(s2.hashCode, s3.hashCode);
}
