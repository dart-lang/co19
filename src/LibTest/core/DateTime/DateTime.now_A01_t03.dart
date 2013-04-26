/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory DateTime.now()
 * Constructs a new DateTime instance with current date time value in the local time zone.
 * @description Checks that the constructed date uses the local time zone.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

main(){
  DateTime d = new DateTime.now();
  Expect.identical(d, d.toLocal());
}
