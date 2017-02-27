/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<S, TT> fuse<TT>(Converter<T, TT> other)
 * Fuses this with other.
 *
 * Encoding with the resulting converter is equivalent to converting with this
 * before converting with other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * are parsed correctly.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table1.lib.dart" show table;

class MyConverter extends Converter<List<int>, Object> {
  Object convert(List<int> input) {
    return input;
  }
}

main() {
  for (List<Object> pair in table) {
    JsonUtf8Encoder encoder = new JsonUtf8Encoder();
    Converter conv = encoder.fuse(new MyConverter());
    Object res = conv.convert(pair[0]);
    Expect.deepEquals(encoder.convert(pair[0]), res);
  }
}
