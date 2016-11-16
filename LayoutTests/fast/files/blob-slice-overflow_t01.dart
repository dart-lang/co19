/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The excessive length passed to Blob.slice() should be trapped
 * and result in a truncated slice being returned.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var text = '';
  for (var i = 0; i < 2000; ++i)
    text += 'A';

  var blob = new Blob([text]);
  var slicedBlob = blob.slice(1999, 9223372036854775000);

  shouldBe(slicedBlob.size, 1);
}
