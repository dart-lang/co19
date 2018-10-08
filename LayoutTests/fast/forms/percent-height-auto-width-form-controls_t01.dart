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
      <p>The form controls of the same type below should be the same width.</p>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <input id="text-a" style="height: 100%">
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <input id="text-b">
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <input id="file-a" type=file style="height: 100%">
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <input id="file-b" type=file>
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <input id="range-a" type=range style="height: 100%">
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <input id="range-b" type=range>
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <select id="select-a" style="height: 100%"><option>aaaaaaaaaaaaaaaaaaaaaaaaa
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <select id="select-b"><option>aaaaaaaaaaaaaaaaaaaaaaaaa
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <select id="multiple-a" multiple style="height: 100%"><option>aaaaaaaaaaaaaaaaaaaaaaaaa
          </td></tr></tbody></table>
      </div>

      <div style="width: 100px; background: pink">
          <table><tbody><tr><td>
              <select id="multiple-b" multiple><option>aaaaaaaaaaaaaaaaaaaaaaaaa
          </td></tr></tbody></table>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ids = ['text', 'file', 'range', 'select', 'multiple'];
  ids.forEach((id) {
    debug('Testing $id');
    shouldBe(document.getElementById(id + '-a').offsetWidth,
             document.getElementById(id + '-b').offsetWidth);
  });
}
