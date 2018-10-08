/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>This page tests that a page with a search popup does not crash, as reported in <a href='https://bugs.webkit.org/show_bug.cgi?id=37141'>this bug</a>. Below is a search input that the test automatically fills then submits. Pass if this does not crash.</p><br><br>
      <FORM action="" id="searchForm">
      <INPUT autosave="my.search" id="searchBox" type="search" results="10" value=""><br>
      <INPUT type="hidden" name="state" value="formSubmitted"><br>
      <INPUT type="submit" value="Search">
      </FORM>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var url = window.location.href;
    if (url.indexOf('formSubmitted') != -1) {
      asyncEnd();
      return;
    }
    (document.getElementById('searchBox') as InputElement).value= 'quentin';
    (document.getElementById('searchForm') as FormElement).submit();
  });
}
