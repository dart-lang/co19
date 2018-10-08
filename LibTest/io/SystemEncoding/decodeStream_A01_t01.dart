/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> decodeStream(Stream<List<int>> byteStream)
 * @description Checks that system encoding decodes from UTF-8 on Linux and Mac
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

void check(SystemEncoding systemEncoding, List<List<int>> input, String expected) {
  Stream<List<int>> byteStream = new Stream.fromIterable(input);
  AsyncExpect.value(expected, systemEncoding.decodeStream(byteStream));
}

main() {
  const SystemEncoding systemEncoding = const SystemEncoding();
  if (Platform.isLinux || Platform.isMacOS) {
    check(systemEncoding, [[117, 116, 102, 45, 56]], "utf-8");
    check(systemEncoding, [[117, 116], [102], [45, 56]], "utf-8");

    check(
        systemEncoding,
        [[0x44, 0x61, 0x74, 0x65, 0x20, 0x64, 0x65, 0x20,
          0x63, 0x72, 0xc3, 0xa9, 0x61, 0x74, 0x69, 0x6f, 0x6e]],
        "Date de création"
    );
    check(
        systemEncoding,
        [[0x44, 0x61, 0x74, 0x65, 0x20, 0x64, 0x65, 0x20],
        [0x63, 0x72, 0xc3, 0xa9, 0x61, 0x74, 0x69, 0x6f, 0x6e]],
        "Date de création"
    );
    check(
        systemEncoding,
        [[0x44, 0x61, 0x74, 0x65], [0x20, 0x64, 0x65, 0x20],
        [0x63, 0x72, 0xc3], [0xa9, 0x61, 0x74, 0x69, 0x6f, 0x6e]],
        "Date de création"
    );
  }
  // For windows there is no way to find current code page
}
