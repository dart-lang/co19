/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String type
 * The name of the event (case-insensitive). 
 * @description Checks expected attribute value.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.equals('click', new Event('click').type);
}
