/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] is correctly added to the consumer with
 * [utf8] encoding.
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";

String str = "Тест для проверки";
List<int> expected = [208, 162, 208, 181, 209, 129, 209, 130, 32, 208, 180, 208,
    187, 209, 143, 32, 208, 191, 209, 128, 208, 190, 208, 178, 208, 181, 209,
    128, 208, 186, 208, 184];

run_process() async {
  stdout.write(str);
  await stdout.flush();
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main(
      new Utf8Codec(allowMalformed: false), expected);
}
