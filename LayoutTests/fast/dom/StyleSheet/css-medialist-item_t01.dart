/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests indexing outside the range of the media list object.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var styleElement  = document.createElement('style');
  styleElement.setAttribute('media', 'screen, print');
  document.documentElement.append(styleElement);
  var mediaList = document.styleSheets[document.styleSheets.length - 1].media;

  shouldEvaluateTo(mediaList.length, 2);
  shouldBeEqualToString(mediaList.item(0), 'screen');
  shouldBeEqualToString(mediaList.item(1), 'print');
  shouldBeNull(mediaList.item(2));
  shouldBeNull(() => mediaList.item(-1));

  styleElement.remove();
}
