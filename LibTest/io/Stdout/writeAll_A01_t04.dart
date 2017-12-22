/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that calling [writeAll(null)] causes [Error].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";
test(Stdout sink) {
  Expect.throws(() { sink.writeAll(null); }, (e) => e is NoSuchMethodError);
}

main() {
  test(stdout);
  test(stderr);
}