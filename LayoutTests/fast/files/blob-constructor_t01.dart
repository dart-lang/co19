/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the Blob constructor.
 */
import "dart:html";
import "dart:typed_data";
import "../../testcommon.dart";

main() {
  // Test the different ways you can construct a Blob.
  shouldBeTrue(new Blob([]) is Blob);
  shouldBeTrue(new Blob(['hello']) is Blob);
  shouldBeTrue(new Blob(['hello'], 'text/html') is Blob);
  shouldBeTrue(new Blob(['hello'], 'text/html', 'native') is Blob);
  shouldBeTrue(new Blob(['hello'], 'text/html', 'transparent') is Blob);

  // Test invalid blob parts.
  shouldThrow(() => new Blob('hello' as dynamic));
  shouldThrow(() => new Blob(0 as dynamic));

  // Test valid blob parts.
  shouldBeTrue(new Blob([]) is Blob);
  shouldBeTrue(new Blob(['stringPrimitive']) is Blob);
  shouldBeTrue(new Blob([new Blob([])]) is Blob);
  shouldBeTrue(new Blob([new Blob([new Blob([])])]) is Blob);

  // Test some invalid property bags.
  shouldThrow(() => new Blob([], 'hello', 'illegalValue'));
  debug('non ASCII type');
  shouldThrow(() => new Blob([], 'hello\u00EE')); // type property must consist of ASCII characters.');

  debug('');
  // Test that the type/size is correctly added to the Blob.
  shouldBe((new Blob([], 'text/html')).type, 'text/html');
  shouldBe((new Blob([], 'text/html')).size, 0);
  debug('type with charset');
  shouldBe((new Blob([], 'text/plain;charset=UTF-8')).type, 'text/plain;charset=utf-8');

  // Test ArrayBufferView parameters.
  shouldBe(new Blob([new Uint8List(100)]).size, 100);
  shouldBe(new Blob([new Uint8ClampedList(100)]).size, 100);
  shouldBe(new Blob([new Uint16List(100)]).size, 200);
  shouldBe(new Blob([new Uint32List(100)]).size, 400);
  shouldBe(new Blob([new Int8List(100)]).size, 100);
  shouldBe(new Blob([new Int16List(100)]).size, 200);
  shouldBe(new Blob([new Int32List(100)]).size, 400);
  shouldBe(new Blob([new Float32List(100)]).size, 400);
  shouldBe(new Blob([new Float64List(100)]).size, 800);

  // Test ArrayBuffer parameters.
  shouldBe(new Blob([(new Uint8List(100)).buffer]).size, 100);
  shouldBe(new Blob([(new Uint8ClampedList(100)).buffer]).size, 100);
  shouldBe(new Blob([(new Uint16List(100)).buffer]).size, 200);
  shouldBe(new Blob([(new Uint32List(100)).buffer]).size, 400);
  shouldBe(new Blob([(new Int8List(100)).buffer]).size, 100);
  shouldBe(new Blob([(new Int16List(100)).buffer]).size, 200);
  shouldBe(new Blob([(new Int32List(100)).buffer]).size, 400);
  shouldBe(new Blob([(new Float32List(100)).buffer]).size, 400);
  shouldBe(new Blob([(new Float64List(100)).buffer]).size, 800);
}
