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
 * ...
 * If compression is provided, the WebSocket created will be configured to
 * negotiate with the specified CompressionOptions. If none is specified then
 * the WebSocket will be created with the default CompressionOptions.
 * @description Checks that this constructor [compression] parameter creates a
 * new WebSocketTransformer object.

 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var v1 = new WebSocketTransformer(compression: CompressionOptions.compressionDefault);
  Expect.isTrue(v1 is WebSocketTransformer);

  var v2 = new WebSocketTransformer(compression: CompressionOptions.compressionOff);
  Expect.isTrue(v2 is WebSocketTransformer);
}
