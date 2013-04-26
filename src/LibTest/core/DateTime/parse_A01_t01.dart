/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.parse(String formattedString)
 * Constructs a new [DateTime] instance based on [formattedString]
 * @description Checks that the DateTime instance is created.
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main(){
  Expect.isTrue(DateTime.parse(new DateTime.now().toString()) is DateTime);
}
