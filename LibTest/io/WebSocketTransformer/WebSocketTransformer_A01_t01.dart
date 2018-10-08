/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * WebSocketTransformer({
 *     dynamic protocolSelector(List<String> protocols),
 *     CompressionOptions compression: CompressionOptions.compressionDefault
 * })
 * Create a new WebSocketTransformer.
 * @description Checks that this constructor without parameters creates a new
 * WebSocketTransformer object.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var v = new WebSocketTransformer();
  Expect.isTrue(v is WebSocketTransformer);
}
