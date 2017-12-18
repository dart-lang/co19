/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * If [separator] is provided, a [write] with the [separator] is performed
 * between any two elements of objects.
 * @description Check that [writeAll] causes [Error] if [separator] is set to
 * [null].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

test(Stdout sink) {
  Expect.throws(() {
    sink.writeAll([1, 2, 3], null);
  }, (e) => e is NoSuchMethodError);
}

main() {
  test(stdout);
  test(stderr);
}