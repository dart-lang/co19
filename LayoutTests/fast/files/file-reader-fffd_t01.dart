/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Throw various bad bytes at file reader.
 */
import "dart:html";
import "dart:typed_data";
import "../../testcommon.dart";

main() {
  var array = new Uint8List.fromList([65, 245, 246, 247, 248, 249, 250, 251,
      252, 253, 254, 255, 66]);
  var blob = new Blob([array]);
  var reader = new FileReader();
  reader.onLoad.listen((event) {
    FileReader target = event.target;
    shouldBe(target.result,
      'A\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFD\uFFFDB');
    asyncEnd();
  });

  asyncStart();
  reader.readAsText(blob);
}
