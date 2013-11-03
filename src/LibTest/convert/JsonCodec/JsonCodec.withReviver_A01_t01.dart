/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory JsonCodec.withReviver(reviver(key, value))
 * Creates a JsonCodec with the given reviver.
 * @description Checks that created object implements specified elements.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";

reviver(key, value) {
  return null;
}

main() {
  JsonCodec res = new JsonCodec.withReviver(reviver);
  Expect.isTrue(res is JsonCodec);
  Expect.isTrue(res.decoder is  JsonDecoder);
  Expect.isTrue(res.encoder is  JsonEncoder);
  Expect.isTrue(res.inverted is  Codec);
  Expect.isTrue(res.decode is  Function);
  Expect.isTrue(res.encode is  Function);
  Expect.isTrue(res.fuse is  Function);
}