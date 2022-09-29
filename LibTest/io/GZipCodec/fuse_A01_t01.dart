// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Codec<S, R> fuse<R>(Codec<T, R> other)
/// Fuses this with other.
///
/// When encoding, the resulting codec encodes with this before encoding with
/// other.
///
/// When decoding, the resulting codec decodes with other before decoding with
/// this.
/// @description Checks that encoding with the resulting converter is equivalent
/// to converting with this before converting with other.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

check(Codec codec, List<int> toEncode) {
  Expect.equals(toEncode, codec.decode(toEncode));
  Expect.equals(toEncode, codec.encode(toEncode));
}

main() {
  GZipCodec codec = new GZipCodec();
  Codec fused = codec.fuse(codec.inverted);

  int max = 1000;
  List<int> data = new List<int>.filled(max, null);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }
  Expect.listEquals(data, fused.decode(data));
  Expect.listEquals(data, fused.encode(data));
}
