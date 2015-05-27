/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the Blob.close() method, basic functionality.
 */
import "dart:html";
import "dart:typed_data";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var blobContents = ['hello'];
  var blob = new Blob(blobContents);
  shouldBeTrue(blob is Blob);
  shouldBe(blob.size, 5);
  blob.close();
  shouldBe(blob.size, 0);

  blob = new Blob(blobContents, "text/plain");
  shouldBeEqualToString(blob.type, "text/plain");
  var sliced1 = blob.slice(2);
  shouldBe(sliced1.size, 3);
  blob.close();
  shouldBe(blob.size, 0);
  shouldBeEqualToString(blob.type, "text/plain");
  shouldBe(sliced1.size, 3);
  var sliced2 = sliced1.slice(2);
  shouldBe(sliced2.size, 1);
  shouldThrow(() => blob.slice(2));
  shouldThrow(() => blob.close());
}
