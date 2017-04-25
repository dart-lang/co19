/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int clientMaxWindowBits
 *  final
 *  Gets the Max Window Bits for the Client.
 * @description Checks that this property gets the Max Window Bits for
 * the Client
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  CompressionOptions co = new CompressionOptions(clientMaxWindowBits: 13);
  Expect.equals(13, co.clientMaxWindowBits);
}
