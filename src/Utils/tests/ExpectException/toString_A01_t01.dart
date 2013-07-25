/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the message.
 * @description Checks that this method returns the exception message.
 * @author rodionov
 * @author varlax
 * @reviewer varlax
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";
 
main() {
  ExpectException e = new ExpectException(null);
  Expect.isTrue(e.toString() == null);
  
  e = new ExpectException("foo");
  Expect.isTrue(e.toString().contains("foo",0));
}
