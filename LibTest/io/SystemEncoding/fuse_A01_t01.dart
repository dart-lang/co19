/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
import 'dart:convert';
/**
 * @assertion Codec<S, R> fuse<R>(Codec<T, R> other)
 *  Fuses this with other.
 *  When encoding, the resulting codec encodes with this before encoding with 
 * other.
 *  When decoding, the resulting codec decodes with other before decoding with 
 * this.
 *  In some cases one needs to use the inverted codecs to be able to fuse them 
 * correctly. That is, the output type of this (T) must match the input type of 
 * the second codec other.
 * @description Checks that [fuse] return codec composed of this and [other]
 * and decoder
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  const SystemEncoding systemEncoding = const SystemEncoding();
  Codec inverted = systemEncoding.inverted;
  Codec fuse = systemEncoding.fuse(inverted);
  Expect.equals("abcd", fuse.encode("abcd"));
  Expect.equals("abcd", fuse.decode("abcd"));
}
