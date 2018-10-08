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
      <p>Test that when dirname attribute is specified then it is added in submission body.</p>

      <form action="#action" name="f">
          <p><label>Comment: <input type=text name="comment" dirname="comment.dir" required></label></p>
          <p><label>WithRTLDir: <textarea name="txtarea" dir="rtl" dirname="txtareaRTL.dir"></textarea></label></p>
          <p><label>WithLTRDir: <textarea name="txtarea1" dir="ltr" dirname="txtareaLTR.dir"></textarea></label></p>
          <p><label>WithInvalidDir: <textarea name="txtarea2" dir="invalid" dirname="txtareaInvalid.dir"></textarea></label></p>
          <p><label>WithRTLValue: <input name="input" dirname="inputRTLvalue.dir" value="مرحبًا"></label></p>
          <p><button name="mode" type=submit value="add">Post Comment</button></p>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var url = window.location.href;

  if (!url.contains('comment.dir')) {
    FormElement f = document.body.querySelector('form');
    f.submit();
  } else {
    shouldBeTrue(window.location.search.contains("comment.dir=ltr"));
    shouldBeTrue(window.location.search.contains("txtareaRTL.dir=rtl"));
    shouldBeTrue(window.location.search.contains("txtareaLTR.dir=ltr"));
    shouldBeTrue(window.location.search.contains("txtareaInvalid.dir=ltr"));
    shouldBeTrue(window.location.search.contains("inputRTLvalue.dir=ltr"));
  }
}
