/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StringConversionSink.fromStringSink(StringSink sink)
 * Creates a new instance wrapping the given sink.
 *
 * Every string that is added to the returned instance is forwarded to the sink.
 * The instance is allowed to buffer and is not required to forward immediately.
 * @description Checks that this constructor creates StringConversionSink
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  StringBuffer stringSink = new StringBuffer();
  stringSink.write("initial:");

  StringConversionSink outSink =
    new StringConversionSink.fromStringSink(stringSink);

  ByteConversionSink inSink = ascii.decoder.startChunkedConversion(outSink);
  var list = ascii.encode("12345");
  inSink.add(list);
  list = ascii.encode("absdABCD");
  inSink.add(list);
  inSink.close();
  Expect.equals("initial:12345absdABCD", stringSink.toString());
}
