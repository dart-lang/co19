/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] with non-ascii characters is correctly
 * added to the consumer with ASCII] encoding with [allowInvalid] set to [true].
 * See also [AsciiCodec] Spec:
 * If allowing invalid values, the values will be decoded into the Unicode
 * Replacement character ([U+FFFD]).
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";

String str = "1âã";
List<int> expected = [49, 226, 227];

run_process() { stdout.write(str); }

main(List<String> args) {
  args.length > 0 ? run_process() : run_main(
      new AsciiCodec(allowInvalid: true), run_process, str, expected);
}
