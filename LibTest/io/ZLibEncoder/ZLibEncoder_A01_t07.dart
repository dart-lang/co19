// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// ZLibEncoder({
///   bool gzip: false,
///   int level: ZLibOption.DEFAULT_LEVEL,
///   int windowBits: ZLibOption.DEFAULT_WINDOW_BITS,
///   int memLevel: ZLibOption.DEFAULT_MEM_LEVEL,
///   int strategy: ZLibOption.strategyDefault,
///   List<int> dictionary: null,
///   bool raw: false
/// })
/// @description Checks that this constructor creates a new ZLibEncoder object
/// with specified [dictionary] parameter.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  List<int> dictionary = [];
  ZLibEncoder v = new ZLibEncoder(dictionary: dictionary);
  Expect.isTrue(v is ZLibEncoder);
  Expect.equals(false, v.gzip);
  Expect.equals(6, v.level);
  Expect.equals(15, v.windowBits);
  Expect.equals(8, v.memLevel);
  Expect.equals(0, v.strategy);
  Expect.equals(dictionary, v.dictionary);
  Expect.equals(false, v.raw);
}
