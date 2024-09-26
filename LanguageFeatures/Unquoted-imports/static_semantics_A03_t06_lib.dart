// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Else if there is only a single segment:
/// ...
/// - Let name be the segment.
/// - Let path be the last `segmentComponent` in the segment. If the segment is
///   `only a single `segmentComponent`, this is the entire segment. Otherwise,
///   it's the last identifier after the last `.`. So in `foo`, path is `foo`.
///   In `foo.bar.baz`, it's `baz`.
/// - The URI is "package:name/path.dart". So `import test;` imports the library
///   "package:test/test.dart", and import `server.api;` imports
///   "package:server.api/api.dart".
///
/// @description Checks that `export test.package1.dart;` exports
/// "package:test.package1.dart/dart.dart".
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

export test.package1.dart; // exports package:test.package1.dart/dart.dart
