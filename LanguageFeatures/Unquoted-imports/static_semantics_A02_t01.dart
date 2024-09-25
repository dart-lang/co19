// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the first segment in segments is "dart":
/// ...
/// - Let path be the concatenation of the remaining segments, separated by `/`.
/// - The URI is "dart:path". So `import dart/async;` imports the library
///   "dart:async".
///
/// @description Checks that `import dart/path;` imports library "dart:path".
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

import dart/async;
import dart/collection as c;
import dart/convert deferred as d;

main() async {
  print(Completer); // From 'dart:async'
  print(c.HashMap); // From 'dart:collection'
  await d.loadLibrary();
  print(d.AsciiCodec); // From 'dart:convert'
}
