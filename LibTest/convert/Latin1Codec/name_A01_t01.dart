/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * @description Checks that this property returns "iso-8859-1"
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Codec codec = new Latin1Codec();
  Expect.equals("iso-8859-1", codec.name);

  codec = new Latin1Codec(allowInvalid: true);
  Expect.equals("iso-8859-1", codec.name);
}
