/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri normalizePath()
 * Returns a URI where the path has been normalized.
 *
 * A normalized path does not contain . segments or non-leading .. segments.
 * Only a relative path with no scheme or authority may contain leading ..
 * segments, a path that starts with / will also drop any leading .. segments.
 *
 * This uses the same normalization strategy as new Uri().resolve(this).
 *
 * Does not change any part of the URI except the path.
 *
 * The default implementation of Uri always normalizes paths, so calling this
 * function has no effect.
 * @description Check that calling of this function has no effect
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var url = Uri.parse('scheme://user:pass@host/path/');
  Expect.equals(url, url.normalizePath());

  url = Uri.parse('../path/');
  Expect.equals(url, url.normalizePath());

  url = Uri.parse('../path/./../a/b.c/');
  Expect.equals(url, url.normalizePath());

  url = Uri.parse('../path/./../a/b.c/ .. /');
  Expect.equals(url, url.normalizePath());
}
