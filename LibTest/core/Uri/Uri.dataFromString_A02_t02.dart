/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri.dataFromString(
 *  String content, {
 *  String mimeType,
 *  Encoding encoding,
 *  Map<String, String> parameters,
 *  bool base64: false
 *  })
 * Creates a data: URI containing the content string.
 * ...
 * If encoding is not provided and parameters has a charset entry, that name is
 * looked up using Encoding.getByName, and if the lookup returns an encoding,
 * that encoding is used to convert content to bytes. If providing both an
 * encoding and a charset parameter, they should agree, otherwise decoding
 * won't be able to use the charset parameter to determine the encoding.
 * ...
 * @description Checks that if encoding is not provided and parameters has no
 * charset entry or Encoding.getByName returns nuu then default encoding is used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    new Uri.dataFromString("Non-ASCII: Кириллица прекрасна!",
        parameters: {"Charset": "utf-8"});
  });
  Expect.throws(() {
    new Uri.dataFromString("Non-ASCII: Кириллица прекрасна!",
        parameters: {"encoding": "utf-8"});
  });
  Expect.throws(() {
    new Uri.dataFromString("Non-ASCII: Кириллица прекрасна!",
        parameters: {"сharset": "utf-88"});
  });
}
