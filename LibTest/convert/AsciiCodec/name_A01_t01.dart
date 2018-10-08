/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * @description Checks that this property returns "us-ascii"
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  AsciiCodec codec = new AsciiCodec();
  Expect.equals("us-ascii", codec.name);

  codec = new AsciiCodec(allowInvalid: true);
  Expect.equals("us-ascii", codec.name);
}
