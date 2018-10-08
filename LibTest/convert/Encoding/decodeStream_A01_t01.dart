/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> decodeStream(Stream<List<int>> byteStream)
 * @description Checks that this method decodes stream to proper string
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

Future check(Encoding encoding, String str) async {
  List<int> data = encoding.encode(str);
  Stream<List<int>> byteStream = new Stream.fromIterable([data]);
  encoding.decodeStream(byteStream).then((String s) {
    Expect.equals(str, s);
  });
}

main() {
  asyncStart();
  Future.wait([
    check(Encoding.getByName("us-ascii"), ""),
    check(Encoding.getByName("us-ascii"), "123abs!#?"),
    check(Encoding.getByName("iso-8859-1"), ""),
    check(Encoding.getByName("iso-8859-1"), "âã"),
    check(Encoding.getByName("utf-8"), ""),
    check(Encoding.getByName("utf-8"), "Кириллица прекрасна"),
  ]).then(
      (_) => asyncEnd()
  );
}
