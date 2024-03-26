// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The library referenced in an `import augment` directive is not an
///   augmentation and does not have a `augment library` directive.
///
/// @description Check that it is a compile-time error if a library referenced
/// in an `import augment` directive is not an does not have a `augment library`
/// directive. Test the case when a main library also imports the referenced one
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library applying_augmentation_library_A01_t03;
