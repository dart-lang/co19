/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.getElementsByName/document.getElementsByName-newelements.html
 * @assertion http://www.whatwg.org/html5/#dom-document-getelementsbyname
 * @description getElementsByName and newly introduced HTML elements
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<section name="section"></section>
<article name="article"></article>
<aside name="aside"></aside>
<hgroup name="hgroup"></hgroup>
<header name="header"></header>
<footer name="footer"></footer>
<nav name="nav"></nav>
<dialog name="dialog"></dialog>
<figure name="figure"></figure>
<audio name="audio"></audio>
<video name="video"></video>
<embed name="embed"></embed>
<mark name="mark"></mark>
<meter name="meter"></meter>
<progress name="progress"></progress>
<time name="time"></time>
<canvas name="canvas"></canvas>
<command name="command"></command>
<menu name="menu"></menu>
<details name="details"></details>
<datalist name="datalist"></datalist>
<keygen name="keygen"></keygen>
<output name="output"></output>
<ruby name="ruby"></ruby>
<rt name="rt"></rt>
<rp name="rp"></rp>
<source name="source">
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);

  assert_equals(document.getElementsByName("section").length, 1);
  assert_equals(document.getElementsByName("section")[0],
                document.getElementsByTagName("section")[0]);
  assert_equals(document.getElementsByName("article").length, 1);
  assert_equals(document.getElementsByName("article")[0],
                document.getElementsByTagName("article")[0]);
  assert_equals(document.getElementsByName("aside").length, 1);
  assert_equals(document.getElementsByName("aside")[0],
                document.getElementsByTagName("aside")[0]);
  assert_equals(document.getElementsByName("hgroup").length, 1);
  assert_equals(document.getElementsByName("hgroup")[0],
                document.getElementsByTagName("hgroup")[0]);
  assert_equals(document.getElementsByName("header").length, 1);
  assert_equals(document.getElementsByName("header")[0],
                document.getElementsByTagName("header")[0]);
  assert_equals(document.getElementsByName("footer").length, 1);
  assert_equals(document.getElementsByName("footer")[0],
                document.getElementsByTagName("footer")[0]);
  assert_equals(document.getElementsByName("nav").length, 1);
  assert_equals(document.getElementsByName("nav")[0],
                document.getElementsByTagName("nav")[0]);
  assert_equals(document.getElementsByName("dialog").length, 1);
  assert_equals(document.getElementsByName("dialog")[0],
                document.getElementsByTagName("dialog")[0]);
  assert_equals(document.getElementsByName("figure").length, 1);
  assert_equals(document.getElementsByName("figure")[0],
                document.getElementsByTagName("figure")[0]);
  assert_equals(document.getElementsByName("audio").length, 1);
  assert_equals(document.getElementsByName("audio")[0],
                document.getElementsByTagName("audio")[0]);
  assert_equals(document.getElementsByName("video").length, 1);
  assert_equals(document.getElementsByName("video")[0],
                document.getElementsByTagName("video")[0]);
  assert_equals(document.getElementsByName("embed").length, 1);
  assert_equals(document.getElementsByName("embed")[0],
                document.getElementsByTagName("embed")[0]);
  assert_equals(document.getElementsByName("mark").length, 1);
  assert_equals(document.getElementsByName("mark")[0],
                document.getElementsByTagName("mark")[0]);
  assert_equals(document.getElementsByName("meter").length, 1);
  assert_equals(document.getElementsByName("meter")[0],
                document.getElementsByTagName("meter")[0]);
  assert_equals(document.getElementsByName("progress").length, 1);
  assert_equals(document.getElementsByName("progress")[0],
                document.getElementsByTagName("progress")[0]);
  assert_equals(document.getElementsByName("time").length, 1);
  assert_equals(document.getElementsByName("time")[0],
                document.getElementsByTagName("time")[0]);
  assert_equals(document.getElementsByName("canvas").length, 1);
  assert_equals(document.getElementsByName("canvas")[0],
                document.getElementsByTagName("canvas")[0]);
  assert_equals(document.getElementsByName("command").length, 1);
  assert_equals(document.getElementsByName("command")[0],
                document.getElementsByTagName("command")[0]);
  assert_equals(document.getElementsByName("menu").length, 1);
  assert_equals(document.getElementsByName("menu")[0],
                document.getElementsByTagName("menu")[0]);
  assert_equals(document.getElementsByName("details").length, 1);
  assert_equals(document.getElementsByName("details")[0],
                document.getElementsByTagName("details")[0]);
  assert_equals(document.getElementsByName("datalist").length, 1);
  assert_equals(document.getElementsByName("datalist")[0],
                document.getElementsByTagName("datalist")[0]);
  assert_equals(document.getElementsByName("keygen").length, 1);
  assert_equals(document.getElementsByName("keygen")[0],
                document.getElementsByTagName("keygen")[0]);
  assert_equals(document.getElementsByName("output").length, 1);
  assert_equals(document.getElementsByName("output")[0],
                document.getElementsByTagName("output")[0]);
  assert_equals(document.getElementsByName("ruby").length, 1);
  assert_equals(document.getElementsByName("ruby")[0],
                document.getElementsByTagName("ruby")[0]);
  assert_equals(document.getElementsByName("rt").length, 1);
  assert_equals(document.getElementsByName("rt")[0],
                document.getElementsByTagName("rt")[0]);
  assert_equals(document.getElementsByName("rp").length, 1);
  assert_equals(document.getElementsByName("rp")[0],
                document.getElementsByTagName("rp")[0]);
  assert_equals(document.getElementsByName("source").length, 1);
  assert_equals(document.getElementsByName("source")[0],
                document.getElementsByTagName("source")[0]);
}
