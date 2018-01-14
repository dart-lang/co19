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
 * @description Checks that exception is  not thrown for ASCII stdout encoding
 * with [allowInvalid] parameter set to [false] if incorrect number has been
 * passed.
 * @author iarkh@unipro.ru
 */
import "dart:convert";
import "dart:io";

List<int> aList = [1000, 74, 99, -7, 0, 100000];

test(Stdout out, Encoding enc) async {
  out.encoding = enc;
  await out.add(aList);
}

run_main(Stdout out) {
  test(out, new AsciiCodec(allowInvalid: false));
  test(out, new AsciiCodec());
}

main(List<String> args) async {
  run_main(stdout);
  run_main(stderr);
}
