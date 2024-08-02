// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void writeln([Object obj = ""])
/// Converts [obj] to a [String] by invoking [Object.toString] and writes the
/// result to [this], followed by a newline.
///
/// @description Checks that [obj] followed by the newline is written.
/// @author iarkh@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

String testString = "Testme";
List<int> testStringCodes = [84, 101, 115, 116, 109, 101];
bool foundObject = false;
bool foundNewLine = false;

class MyStreamConsumer implements StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      // There can be [["Testme"], ["\n"]] and [["Testme\n"]]. Both Ok.
      for (var list in x) {
        if (list.last == 10) {
          foundNewLine = true;
        }
        if (list.length >= testStringCodes.length) {
          foundObject = true;
          for (int i = 0; i < testStringCodes.length; i++) {
            if (list[i] != testStringCodes[i]) {
              foundObject = false;
              break;
            }
          }
        }
      }
    });
    return new Future(() {});
  }

  Future close() => new Future(() {});
}

test() async {
  StreamConsumer<List<int>> consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.writeln(testString);
  await sink.close();
  Expect.isTrue(foundObject);
  Expect.isTrue(foundNewLine);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
