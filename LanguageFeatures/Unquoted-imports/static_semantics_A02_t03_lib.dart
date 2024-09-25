// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the first segment in segments is "dart":
/// ...
/// - Let path be the concatenation of the remaining segments, separated by `/`.
/// - The URI is "dart:path". So `import dart/async;` imports the library
///   "dart:async".
///
/// @description Checks that `export dart/path;` exports library "dart:path".
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=unquoted-imports

export dart/async;
