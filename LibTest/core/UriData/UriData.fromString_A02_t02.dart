/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData.fromString(
 *  String content, {
 *  String mimeType,
 *  Encoding encoding,
 *  Map<String, String> parameters,
 *  bool base64: false
 *  })
 * Creates a data: URI containing the content string.
 * Equivalent to new Uri.dataFromString(...).data, but may be more efficient if
 * the uri itself isn't used.
 * @description Checks that if encoding is not provided and parameters has no
 * charset entry or Encoding.getByName returns nuu then default encoding is used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    new UriData.fromString("Non-ASCII: Кириллица прекрасна!",
        parameters: {"Charset": "utf-8"});
  });
  Expect.throws(() {
    new UriData.fromString("Non-ASCII: Кириллица прекрасна!",
        parameters: {"encoding": "utf-8"});
  });
  Expect.throws(() {
    new UriData.fromString("Non-ASCII: Кириллица прекрасна!",
        parameters: {"сharset": "utf-88"});
  });
}
