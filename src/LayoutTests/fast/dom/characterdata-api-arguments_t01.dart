/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the CharacterData API arguments are correctly
 * validated.
 */
import "dart:html";
import "../../testcommon.dart";

_shouldThrow(func(), name) =>
  shouldThrow(func, (e) => e is DomException && e.name == name);

main() {
  var text = new Text("abcd");
  shouldBeEqualToString(text.data, "abcd");

  // appendData()
  shouldNotThrow(() => text.appendData('efg'));
  shouldBeEqualToString(text.data, "abcdefg");
  shouldThrow(() => text.appendData());
  shouldBeEqualToString(text.data, "abcdefg");

  // insertData()
  text.data = "efg";
  shouldNotThrow(() => text.insertData(0, 'abcd'));
  shouldBeEqualToString(text.data, "abcdefg");
  shouldThrow(() => text.insertData());
  shouldBeEqualToString(text.data, "abcdefg");
  shouldThrow(() => text.insertData(0));
  shouldBeEqualToString(text.data, "abcdefg");
  _shouldThrow(() => text.insertData(999, 'test'), DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcdefg");
  // Does not throw in js because of wrapping
  // Throws in dart cause dart has bignums
  shouldThrow(() => text.insertData(-4294967294, 'test'));

  // deleteData()
  text.data = "abcdefg";
  shouldNotThrow(() => text.deleteData(4, 3));
  shouldBeEqualToString(text.data, "abcd");
  shouldThrow(() => text.deleteData());
  shouldBeEqualToString(text.data, "abcd");
  shouldThrow(() => text.deleteData(0));
  shouldBeEqualToString(text.data, "abcd");
  _shouldThrow(() => text.deleteData(999, 3), DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcd");
  _shouldThrow(() => text.deleteData(-1, 3), DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcd");
  // Does not throw in js because of wrapping
  // Throws in dart cause dart has bignums
  shouldThrow(() => text.deleteData(-4294967294, 2));
  shouldNotThrow(() => text.deleteData(1, 999)); // Length argument is too large, should be adjusted.
  shouldBeEqualToString(text.data, "a");

  // ReplaceData()
  text.data = "efg";
  shouldNotThrow(() => text.replaceData(0, 0, 'abcd'));
  shouldBeEqualToString(text.data, "abcdefg");
  shouldThrow(() => text.replaceData());
  shouldBeEqualToString(text.data, "abcdefg");
  shouldThrow(() => text.replaceData(0));
  shouldBeEqualToString(text.data, "abcdefg");
  shouldThrow(() => text.replaceData(0, 0));
  shouldBeEqualToString(text.data, "abcdefg");
  _shouldThrow(() => text.replaceData(999, 3, 'test'), DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcdefg");
  _shouldThrow(() => text.replaceData(-1, 3, 'test'), DomException.INDEX_SIZE);
  shouldBeEqualToString(text.data, "abcdefg");
  // Does not throw in js because of wrapping
  // Throws in dart cause dart has bignums
  shouldThrow(() => text.replaceData(-4294967294, 0, 'test'));
  shouldNotThrow(() => text.replaceData(1, 999, 'aaa'));
  shouldBeEqualToString(text.data, "aaaa");

  // substringData()
  text.data = "abcdefg";
  shouldBeEqualToString(text.substringData(4, 3), "efg");
  shouldThrow(() => text.substringData());
  shouldThrow(() => text.substringData(0));
  shouldBeEqualToString(text.substringData(4, 999), "efg");
  // ok in js, not in dart
  shouldThrow(() => text.substringData(4, -1));
  _shouldThrow(() => text.substringData(-1, 2), DomException.INDEX_SIZE);
  // ok in js, not in dart
  _shouldThrow(() => text.substringData(-4294967294, 3), DomException.INDEX_SIZE);
}
