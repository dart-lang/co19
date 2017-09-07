/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converter<List<int>, TT> fuse<TT>(Converter<List<int>, TT> other)
 * Fuses this with other.
 * Encoding with the resulting converter is equivalent to converting with this
 * before converting with other.
 * @description Checks that encoding with the resulting converter is equivalent
 * to converting with this before converting with other.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibEncoder encoder = new ZLibEncoder();
  Converter fused = encoder.fuse(new ZLibDecoder());

  Expect.listEquals([], fused.convert([]));

  for (int i = 0; i < 10; i++) {
    List<int> data = new List.generate(i, (i) => i);
    Expect.listEquals(data, fused.convert(data));
  }
}
