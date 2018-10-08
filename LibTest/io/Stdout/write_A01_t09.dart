/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] cannot be written if [encoding] is [null].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

test(Stdout sink) {
  sink.encoding = null;
  Expect.throws(() { sink.write("testme"); }, (e) => e is NoSuchMethodError);
  sink.close();
}

main() {
  test(stdout);
  test(stderr);
}