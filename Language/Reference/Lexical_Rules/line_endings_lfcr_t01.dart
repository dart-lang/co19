// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Dart source text is represented as a sequence of Unicode code
/// points.
///
/// @description Checks that Dart program may use LFCR line endings
/// @author sgrekhov22@gmail.com

String hello() => "Hello";

class World {
  String world() {
    return "World!";
  }
}

main() {
  print(hello() + " " + World().world());
}
