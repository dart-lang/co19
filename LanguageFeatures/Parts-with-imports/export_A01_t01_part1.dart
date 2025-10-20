// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any Dart file can contain an `export` directive. It makes no
/// difference which file an `export` is in, its exported declarations (filtered
/// by any `hide` or `show` combinators) are added to the library's single
/// export scope, along with those of any other export directives in the library
/// and all non-private declarations of the library itself. Conflicts are
/// handled as usual (as a compile-time error if it's not the same declaration).
///
/// @description Check that an export directive contained in a part file of a
/// library is added to the library's export scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'export_A01_t01_lib.dart';

export 'parts_lib.dart';

part 'export_A01_t01_part2.dart';
