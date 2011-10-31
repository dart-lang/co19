/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an immutable hash code for this send port that is
 * consistent with the == operator.
 * @description Checks that [hashCode] is consistent with operator ==.
 * @author msyabro
 */

void main() {
  ReceivePort r1 = new ReceivePort();
  ReceivePort r2 = new ReceivePort();
  
  SendPort s1 = r1.toSendPort();
  SendPort s2 = r2.toSendPort();
  SendPort s3 = r2.toSendPort();
  
  r1.close();
  r2.close();
  
  print(s1.hashCode());
  print(s2.hashCode());
  print(s3.hashCode());
  
  Expect.isFalse(s1.hashCode() == s2.hashCode());
  Expect.equals(s2.hashCode(), s3.hashCode());
}