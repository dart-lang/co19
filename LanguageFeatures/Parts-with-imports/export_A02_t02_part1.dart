// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any Dart file can contain an `export` directive. It makes no
/// difference which file an `export` is in, its declarations (filtered by any
/// `hide` or `show` modifiers) are added to the library’s single export scope,
/// along with those of any other `exports` in the library and the non-private
/// declarations of the library itself. Conflicts are handled as usual (as an
/// error if it’s not the same declaration).
///
/// @description Check that it is a compile-time error if exported libraries
/// have a name conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'export_A02_t02.dart';

export 'parts_lib.dart';

part 'export_A02_t02_part2.dart';
