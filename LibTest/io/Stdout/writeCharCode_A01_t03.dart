/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Writes the character of [charCode].
 * This method is equivalent to [write(new String.fromCharCode(charCode))].
 * @description Checks that correct char code is written for the [128...1114111]
 * range.
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";

List<int> objects = [1, 500, 500, 512, 513, 1024, 2500, 111000, 1114111];
List<int> expected = [1, 199, 180, 199, 180, 200, 128, 200, 129, 208, 128, 224,
    167, 132, 240, 155, 134, 152, 244, 143, 191, 191];

run_process() {
  for(int i = 0; i < objects.length; i++) {
    stdout.writeCharCode(objects[i]);
  };
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main(
      Encoding.getByName("UTF-16"), expected);
}
