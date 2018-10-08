/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<S, dynamic> fuse(Converter<T, dynamic> other)
 * Fuses this with other.
 * Encoding with the resulting converter is equivalent to converting with this
 * before converting with other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "table1.lib.dart" show table;

main() {
  for (List<Object> pair in table) {
    JsonDecoder jdec = new JsonDecoder(null);
    Converter conv = jdec.fuse(new JsonEncoder());
    Object res = conv.convert(pair[1]);
    Expect.equals(pair[1], res);
  }
}
