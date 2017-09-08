/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> dictionary
 * Initial compression dictionary.
 * It should consist of strings (byte sequences) that are likely to be
 * encountered later in the data to be compressed, with the most commonly used
 * strings preferably put towards the end of the dictionary. Using a dictionary
 * is most useful when the data to be compressed is short and can be predicted
 * with good accuracy; the data can then be compressed better than with the
 * default empty dictionary.
 * @description Checks that [dictionary] is set correctly with values null or
 * List<int>. The default value is null.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec codec = new ZLibCodec(dictionary: [1,2,3]);
  Expect.listEquals([1,2,3], codec.dictionary);
  codec = new ZLibCodec(dictionary: null);
  Expect.equals(null, codec.dictionary);
}
