/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Helper library for testing [stderr] and [stdout]
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";

main(List<String> arguments) {
  if (arguments.length > 0) {
    stdout.write(arguments[0]);
  }
  if (arguments.length > 1) {
    stderr.write(arguments[1]);
  }
  if (arguments.length > 2) {
    stdin.listen((List<int> event){
      Utf8Decoder decoder = new Utf8Decoder();
      String decoded = decoder.convert(event);
      stdout.write(decoded);
    });
  }
}
