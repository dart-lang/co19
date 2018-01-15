/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that attempt to write [String] with non-ascii characters
 * causes exception if encoding is ASCI with [allowInvalid] set to [true].
 * See also [AsciiCodec] Spec:
 * If allowing invalid values, the values will be decoded into the Unicode
 * Replacement character ([U+FFFD]). If not, an exception will be thrown.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:convert";
import "dart:io";

run_main(Stdout sink, Encoding enc) async {
  sink.encoding = enc;
  Expect.throws(() { sink.write("âã�"); }, (e) => e is ArgumentError);
}

main(List<String> args) {
  run_main(stdout, new AsciiCodec(allowInvalid: false));
  run_main(stderr, new AsciiCodec(allowInvalid: false));
}
