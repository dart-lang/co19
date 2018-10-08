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
 * @description CChecks that this constructor with [protocolSelector] parameter
 * ([selector] return a Future completing with a String) creates a new
 * WebSocketTransformer object.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var protocols = ["p1.com", "p2.com"];
  Future selector(List<String> receivedProtocols) async {
    Expect.listEquals(protocols, receivedProtocols);
    return (await protocols[0]);
  }
  asyncStart();
  var v = new WebSocketTransformer(protocolSelector: selector);
  Expect.isTrue(v is WebSocketTransformer);
  asyncEnd();
}
