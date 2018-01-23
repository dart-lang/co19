/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer, ignoring [encoding].
 * The [encoding] does not apply to this method, and the [data] list is passed
 * directly to the target consumer as a stream event.
 * @description Checks that expected data passed for ASCII stdout encoding with
 * [allowInvalid] parameter set to [true] as is
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "test.lib.dart";

List<int> aList = [126, 127, 128, 254, 255, 256, 510, 511, 512, 513, 1000, 2000,
  3000, -1, -2, -3, -255, -256];

run_process() { stdout.add(aList); }

main(List<String> args) {
  args.length > 0 ? run_process() : run_main(
      new AsciiCodec(allowInvalid: true), run_process, aList, aList);
}
