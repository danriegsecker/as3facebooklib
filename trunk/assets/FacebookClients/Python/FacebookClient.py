#!/usr/bin/python

#    FacebookClient, a python library for accessing the Facebook REST API.
#    Copyright (C) 2006       Jason Prado <jason at realtangible.com>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#Thanks to Samuel Cormier-Iijima  for posting a Python client also. The Error
#class was borrowed from there.

# Modified by Max Battcher to make it all the more Pythonic

import urllib
import xml.dom.minidom
import md5
import time
import xmltramp

class FacebookError(Exception):
    """Exception class for errors received from Facebook."""
    def __init__(self, code, msg):
        self.code = code
        self.msg = msg
        print 'Error ' + code + ': ' + msg
    def __str__(self):
        return 'Error ' + code + ': ' + msg

class FacebookClient(object):
    FacebookURL = "http://api.facebook.com/restserver.php"
    FacebookSecureURL = "https://api.facebook.com/restserver.php"
    def __init__(self, api_key, secret_key):
        """Construct an instance of the FacebookClient."""
        self.api_key = api_key
        self.secret_key = secret_key
        self.secret = secret_key
        self.session_key = None
        self.auth = AuthFacebookProxy(self, "facebook.auth")

    def __hash_args(self, args):
        hasher = md5.new(''.join([x + '=' + args[x] for x in sorted(args.keys())]))
        hasher.update(self.secret)
        return hasher.hexdigest()

    def _getAuthURL(self):
        return "http://api.facebook.com/login.php?api_key=" + self.api_key + "&auth_token=" + self.auth_token

    def _setAuthToken(self, token):
        self.auth_token = token

    def _do_request(self, secure, args):
        for arg in args.items():
            if type(arg[1]) == list:
                args[arg[0]] = ','.join(arg[1])
        args['api_key'] = self.api_key
        args['sig'] = self.__hash_args(args)
        post_data = urllib.urlencode(args)
        if secure:
            url = self.FacebookSecureURL + "?" + post_data
        else:
            url = self.FacebookURL + "?" + post_data
        try:
            rsp = xmltramp.load(url)
        except:
            raise RuntimeError("Failed to download and parse XML result.")
        self._check_error(rsp)
        return rsp

    def _check_error(self, res):
        code = ""
        msg = ""
        try:
            code = str(res['fb_error']['code'])
            msg = str(res['fb_error']['msg'])
        except:
            return
        raise FacebookError(code, msg)

    def __getattr__(self, attr, **args):
        self.__dict__[attr] = FacebookProxy(self, "facebook." + attr)
        return self.__dict__[attr]

class FacebookProxy:
    """
    FacebookProxy represents either a Facebook API call and/or a Facebook API "object" of API calls.
    """

    def __init__(self, client, path):
        self._client = client
        self._path = path

    def __str__(self):
        return self._path

    def __repr__(self):
        return "<FacebookProxy: %s>" % (self._path)

    def __call__(self, **args):
        if not self._client.session_key:
            raise RuntimeError("Session key not yet set. Make sure auth.getSession has been called.")
        args["method"] = self._path
        args['session_key'] = self._client.session_key
        args['call_id'] = str(int(time.time()) * 1000)
        return self._client._do_request(False, args)

    def __getattr__(self, attr, **args):
        self.__dict__[attr] = FacebookProxy(self._client, self._path + "." + attr)
        return self.__dict__[attr]


class AuthFacebookProxy(FacebookProxy):
    """
    Adds overloads for "special" auth methods.
    """
    def getSession(self):
        args = {}
        args['auth_token'] = self._client.auth_token
        args['method'] = "facebook.auth.getSession"
        res = self._client._do_request(True, args)
        self._client.session_key = str(res['session_key'])
        self._client.uid = str(res['uid'])
        try:
            self._client.secret = str(res['secret'])
        except:
            pass
        return res

    def createToken(self):
        res = self._client._do_request(True, {'method':"facebook.auth.createToken"})
        #print "res: " + str(res)
        self._client.auth_token = str(res['token'])
        return self._client.auth_token
    
# vim: et ai ts=4 sts=4 sw=4
