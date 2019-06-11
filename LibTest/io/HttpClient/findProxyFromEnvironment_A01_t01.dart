/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String findProxyFromEnvironment(
 *  Uri url, {
 *  Map<String, String> environment
 *  })
 * Function for resolving the proxy server to be used for a HTTP connection from
 * the proxy configuration specified through environment variables.
 *
 * The following environment variables are taken into account:
 *
 * http_proxy
 * https_proxy
 * no_proxy
 * HTTP_PROXY
 * HTTPS_PROXY
 * NO_PROXY
 * http_proxy and HTTP_PROXY specify the proxy server to use for http:// urls.
 * Use the format hostname:port. If no port is used a default of 1080 will be
 * used. If both are set the lower case one takes precedence.
 *
 * https_proxy and HTTPS_PROXY specify the proxy server to use for https://
 * urls. Use the format hostname:port. If no port is used a default of 1080 will
 * be used. If both are set the lower case one takes precedence.
 *
 * no_proxy and NO_PROXY specify a comma separated list of postfixes of
 * hostnames for which not to use the proxy server. E.g. the value
 * "localhost,127.0.0.1" will make requests to both "localhost" and "127.0.0.1"
 * not use a proxy. If both are set the lower case one takes precedence.
 *
 * To activate this way of resolving proxies assign this function to the
 * findProxy property on the HttpClient.
 *
 * HttpClient client = new HttpClient();
 * client.findProxy = HttpClient.findProxyFromEnvironment;
 * If you don't want to use the system environment you can use a different one
 * by wrapping the function.
 *
 * HttpClient client = new HttpClient();
 * client.findProxy = (url) {
 *   return HttpClient.findProxyFromEnvironment(
 *     url, {"http_proxy": ..., "no_proxy": ...});
 *   }
 * If a proxy requires authentication it is possible to configure the username
 * and password as well. Use the format username:password@hostname:port to
 * include the username and password. Alternatively the API addProxyCredentials
 * can be used to set credentials for proxies which require authentication.
 *
 * @description Checks using of default value of findProxyFromEnvironment
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  String hello = "Hello world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    Expect.isNull(request.headers[HttpHeaders.proxyAuthorizationHeader]);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.findProxy = HttpClient.findProxyFromEnvironment;

  client.get(localhost, server.port, "")
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(hello, content);
    });
  });
}

main() {
  asyncStart();
  test();
}
