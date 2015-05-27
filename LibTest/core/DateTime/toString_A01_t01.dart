/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a human readable string for this instance.
 * The returned string is constructed for the time zone of this instance. 
 * @description check that returned value is String
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new DateTime.now().toString() is String);
}
