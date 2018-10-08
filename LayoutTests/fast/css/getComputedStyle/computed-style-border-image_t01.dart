/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test computed style for the border-image property and sub-properties</p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.createElement('div');
  testDiv.style.borderWidth = '10px';
  document.body.append(testDiv);

  computedBorderImageStyle(borderImageStyle, property) {
    testDiv.style.borderImage = 'none';
    testDiv.style.borderImage = borderImageStyle;
    return getComputedStyle(testDiv).getPropertyValue(property);
  }

  checkComputedStyleValue() {
    var before = getComputedStyle(testDiv).getPropertyValue('border-image');
    testDiv.style.borderImage = 'none';
    testDiv.style.borderImage = before;
    return (getComputedStyle(testDiv).getPropertyValue('border-image') == before);
  }

  shouldBe(computedBorderImageStyle('12 11 12 11', 'border-image-slice'), '12 11');
  shouldBe(computedBorderImageStyle('12 11 12 11', 'border-image'), 'none');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 12 11 repeat stretch', 'border-image-slice'), '12 11');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 12 11 repeat stretch', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 12 11 / 1 / 0px repeat stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 1 2 3 4 repeat stretch', 'border-image-slice'), '1 2 3 4');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 1 2 3 4 repeat stretch', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 1 2 3 4 / 1 / 0px repeat stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 12 repeat stretch', 'border-image-slice'), '12');
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 10 5 5 repeat stretch', 'border-image-slice'), '10 10 5 5');
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 a b c repeat stretch', 'border-image-slice'), '100%');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 a b c repeat stretch', 'border-image'), 'none');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 20 fill', 'border-image-slice'), '10 20 fill');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 20 fill', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 20 fill / 1 / 0px stretch');
  shouldBe(checkComputedStyleValue(), true);

  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 10 10 10 repeat stretch', 'border-image-source'), 'url("dummy://IntentionallyMissingFile.png")');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 10 10 10 repeat stretch', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 1 / 0px repeat stretch');
  shouldBe(checkComputedStyleValue(), true);

  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10', 'border-image-repeat'), 'stretch');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 1 / 0px stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 stretch', 'border-image-repeat'), 'stretch');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 stretch', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 1 / 0px stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 kittens', 'border-image-repeat'), 'stretch');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 kittens', 'border-image'), 'none');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 stretch stretch fill', 'border-image-repeat'), 'stretch');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 stretch stretch fill', 'border-image'), 'none');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 repeat stretch', 'border-image-repeat'), 'repeat stretch');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 repeat stretch', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 1 / 0px repeat stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 round space', 'border-image-repeat'), 'round space');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 round space', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 1 / 0px round space');
  shouldBe(checkComputedStyleValue(), true);

  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 / 13px 1.5em 1em 10px', 'border-image-width'), '13px 24px 16px 10px');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 / 13px 1.5em 1em 10px', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 13px 24px 16px 10px / 0px stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 / 14px 10%', 'border-image-width'), '14px 10%');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 / 14px 10%', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 14px 10% / 0px stretch');
  shouldBe(checkComputedStyleValue(), true);
  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 / 13px / 11px', 'border-image-outset'), '11px');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 / 13px / 11px', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 13px / 11px stretch');
  shouldBe(checkComputedStyleValue(), true);

  shouldBe(computedBorderImageStyle('url(IntentionallyMissingFile.png) 10 / 13px / 11px repeat stretch', 'border-image-outset'), '11px');
  shouldBe(computedBorderImageStyle('url("dummy://IntentionallyMissingFile.png") 10 / 13px / 11px repeat stretch', 'border-image'), 'url("dummy://IntentionallyMissingFile.png") 10 / 13px / 11px repeat stretch');
  shouldBe(checkComputedStyleValue(), true);
}
