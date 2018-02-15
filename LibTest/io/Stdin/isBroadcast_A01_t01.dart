/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isBroadcast
 * Whether this stream is a broadcast stream.
 * @description Checks that [isBroadcast] is a valid [boolean] value and can be
 * read inside the dart process.
 * @author iarkh@unipro.ru
 * @issue 31932
 */
import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  Expect.isTrue(stdin.isBroadcast || !stdin.isBroadcast);
}
