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
 * [UTF8] encoding.
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";

String str = "Тест для проверки";
List<int> expected = [1058, 1077, 1089, 1090, 32, 1076, 1083, 1103, 32, 1087,
    1088, 1086, 1074, 1077, 1088, 1082, 1080];

run_process() { stdout.write(str); }

main(List<String> args) {
  args.length > 0 ? run_process() : run_main(
      new Utf8Codec(allowMalformed: false), run_process, str, expected);
}
