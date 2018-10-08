/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Tests whether [other] is a SendPort 
 * pointing to the same ReceivePort as this one.
 *
 * @description Checks that two SendPorts equals only if they
 * point to the same ReceivePort even after closing the ReceivePort.
 *
 * @author msyabro
 */
import "../../../Utils/expect.dart";

import "dart:isolate";

void main() {
  ReceivePort r1 = new ReceivePort();
  ReceivePort r2 = new ReceivePort();
  
  SendPort s1 = r1.sendPort;
  SendPort s2 = r1.sendPort;
  SendPort s3 = r2.sendPort;
  SendPort s4 = r2.sendPort;
  
  Expect.isTrue(s1 == s2);
  Expect.isTrue(s3 == s4);
  
  Expect.isFalse(s1 == s3);
  Expect.isFalse(s1 == s4);
  Expect.isFalse(s2 == s3);
  Expect.isFalse(s2 == s4);
  
  r1.close();
  Expect.isTrue(s1 == s2);
  Expect.isTrue(s3 == s4);

  Expect.isFalse(s1 == s3);
  Expect.isFalse(s1 == s4);
  Expect.isFalse(s2 == s3);
  Expect.isFalse(s2 == s4);

  r2.close();
  Expect.isTrue(s1 == s2);
  Expect.isTrue(s3 == s4);

  Expect.isFalse(s1 == s3);
  Expect.isFalse(s1 == s4);
  Expect.isFalse(s2 == s3);
  Expect.isFalse(s2 == s4);
}
