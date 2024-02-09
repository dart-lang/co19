// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void close()
/// Closes the sink.
///
/// This signals the end of the chunked conversion. This method is called when
/// converters are used as StreamTransformer's.
/// @description Checks that this method closes the sink.
/// @issue 29329
/// @author sgrekhov@unipro.ru

library close_A01_t01;

import "dart:convert";
import "../../../Utils/expect.dart";

test(ChunkedConversionSink create(ChunkedConversionSink<List<int>> outSink)) {
  bool called = false;
  Utf8Codec codec = new Utf8Codec();
  var encoded = codec.encode("Кириллица");

  var outSink = new ChunkedConversionSink<List<int>>.withCallback((accumulated) {
    called = true;
    Expect.listEquals([encoded], accumulated);
  });

  ByteConversionSink inSink = create(outSink) as ByteConversionSink;
  var list = utf8.encode("Кириллица");

  Expect.isFalse(called);
  inSink.add(list);
  Expect.isFalse(called);
  inSink.close();
  Expect.isTrue(called);

  list = utf8.encode("прекрасна");
  inSink.add(list);
  inSink.close();
}
