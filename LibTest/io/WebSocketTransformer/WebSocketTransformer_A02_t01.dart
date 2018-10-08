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
 * If protocolSelector is provided, protocolSelector will be called to select
 * what protocol to use, if any were provided by the client. protocolSelector
 * is should return either a String or a Future completing with a String.
 * The String must exist in the list of protocols.
 * @description Checks that this constructor with [protocolSelector] parameter
 * ([selector] return a String) creates a new WebSocketTransformer object.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var protocols = ["p1.com", "p2.com"];
  selector(List<String> receivedProtocols) {
    Expect.listEquals(protocols, receivedProtocols);
    return "p2.com";
  }

  var v = new WebSocketTransformer(protocolSelector: selector);
  Expect.isTrue(v is WebSocketTransformer);
}
