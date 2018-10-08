/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteConversionSink startChunkedConversion(Sink<List<int>> sink)
 * Start a chunked conversion. While it accepts any Sink taking List<int>'s,
 * the optimal sink to be passed as sink is a ByteConversionSink.
 * @description Checks that the the [startChunkedConversion] method starts a
 * chunked conversion.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

void check(List<int> data) {
  ZLibEncoder encoder = new ZLibEncoder();
  List<int> expectedData = encoder.convert(data);
  bool called = false;

  Sink<List<int>> outSink = new ChunkedConversionSink.withCallback((chunks) {
    int first = 0;
    for (int i = 0; i < chunks.length; i++) {
      int chunkLength = chunks[i].length;
      Expect.listEquals(expectedData.sublist(first, first + chunkLength), chunks[i]);
      first += chunkLength;
    }
    called = true;
  });

  ByteConversionSink inSink = encoder.startChunkedConversion(outSink);
  inSink.add(data);
  inSink.close();
  Expect.isTrue(called, "called false");
}

main() {
  for (int i = 0; i < 128; i++) {
    check(new List.generate(i, (int i) => i%256));
  }
  check([]);
}
