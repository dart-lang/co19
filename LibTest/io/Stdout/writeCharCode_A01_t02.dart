/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Writes the character of [charCode].
 * This method is equivalent to [write(new String.fromCharCode(charCode))].
 * @description Checks that [writeCharCode] does not accept negative and too big
 * values.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

test(Stdout sink, int i) async {
  Expect.throws(() { sink.writeCharCode(i); }, (e) => e is RangeError);
  Expect.throws(() {
    sink.write(new String.fromCharCode(i));
  }, (e) => e is RangeError);
}

main() {
    test(stdout, -1);
    test(stderr, -1);
    test(stdout, -2045);
    test(stderr, -2045);
    test(stdout, 1114112);
    test(stderr, 1114112);
    test(stdout, 1000000000);
    test(stderr, 1000000000);
}
