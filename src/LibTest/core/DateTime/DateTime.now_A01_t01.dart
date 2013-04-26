/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory DateTime.now()
 * Constructs a new DateTime instance with current date time value in the local time zone.
 * @description Checks that the DateTime instance is created.
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main(){
  Expect.isTrue(new DateTime.now() is DateTime);
}
