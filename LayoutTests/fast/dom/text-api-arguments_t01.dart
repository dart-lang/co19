/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the Text API arguments are correctly validated.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var text = new Text("abcdefg");
  shouldBeEqualToString(text.data, "abcdefg");

  // Text splitText(unsigned long offset)
  shouldBeEqualToString(text.splitText(4).data, "efg");
  shouldBeEqualToString(text.data, "abcd");
  shouldThrow(() => text.splitText());
  shouldBeEqualToString(text.data, "abcd");
  shouldThrow(() => text.splitText(999),
      (e) => e is DomException && e.name == DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcd");
  shouldThrow(() => text.splitText(-1),
      (e) => e is DomException && e.name == DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcd");
  // NA to dart
  //shouldBeEqualToString(text.splitText(-4294967294).data, "cd"); // Wraps to 2, which is a valid offset.
  //shouldBeEqualToString(text.data, "ab");
}
