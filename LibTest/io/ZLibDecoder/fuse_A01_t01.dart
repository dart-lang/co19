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

check(Converter fused, List<int> l) {
  Expect.listEquals(l, fused.convert(l));
}

main() {
  ZLibEncoder encoder = new ZLibEncoder();
  ZLibDecoder decoder = new ZLibDecoder();
  Converter fused = decoder.fuse(new ZLibEncoder());

  for (int i = 0; i < 10; i++) {
    check(fused, encoder.convert([i, i + 1]));
  }
  check(fused, encoder.convert([]));
}
