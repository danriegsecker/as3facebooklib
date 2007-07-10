/*
Adobe Systems Incorporated(r) Source Code License Agreement
Copyright(c) 2005 Adobe Systems Incorporated. All rights reserved.
	
Please read this Source Code License Agreement carefully before using
the source code.
	
Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.
	
The name "Adobe Systems Incorporated" must not be used to endorse or promote products
derived from the source code without prior written permission.
	
You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
against any loss, damage, claims or lawsuits, including attorney's
fees that arise or result from your use or distribution of the source
code.
	
THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.adobe.webapis.facebook {
	
	import com.adobe.webapis.facebook.facebookservice_internal;
	import com.adobe.crypto.MD5;
	import com.adobe.webapis.URLLoaderBase;
	import com.adobe.webapis.facebook.methodgroups.*;
	import flash.net.URLLoader;
	
	/**
	 * The FacebookService class abstracts the Facebook API found
	 * at http://developers.facebook.com
	 */
	public class FacebookService extends URLLoaderBase {
		
		/**
		 * The REST endpoint where we can talk with Flickr service
		 */
		public static const END_POINT:String = "http://api.facebook.com/restserver.php?";
		
		/**
		 * The endpoint where we go for authentication
		 */
		public static const AUTH_END_POINT:String = "http://www.facebook.com/login.php?";
		
		/** 
		 * Store the API key that gives developers access to the Flickr service 
		 */
		private var _api_key:String;
		
		/**
		 * The "shared secret" of your application for authentication
		 */
		private var _secret:String;
		
		/**
		 * The token identifying the user as logged in
		 */
		private var _token:String;
		
		/**
		 * One of the consants from the AuthPerm class corresponding
		 * to the current permission the authenticated user has
		 */
		private var _permission:String;
		
		/**
		 * Private variable that we provide read-only access to
		 */
		private var _auth:Auth;
//		private var _feed:Feed;
//		private var _friends:Friends;
//		private var _notifications:Notifications;
//		private var _profile:Profile;
//		private var _users:Users;
//		private var _events:Events;
//		private var _groups:Groups;
//		private var _photos:Photos;
//		private var _test:Test;
//		private var _urls:Urls;
		
		public function FacebookService( api_key:String ) {
			_api_key = api_key;
			_permission = AuthPerm.NONE;
			_token = "";
			
			_auth = new Auth( this );
//			_feed = new Feed( this );
//			_friends = new Friends( this );
//			_notifications = new Notifications( this );
//			_profile = new Profile( this );
//			_users = new Users( this );
//			_events = new Events( this );
//			_groups = new Groups( this );
//			_photos = new Photos( this );
//			_test = new Test( this );
//			_urls = new Urls( this );
			
		}
		
		/**
		 * Returns the current API key in use for accessing the Facebook service.
		 *  
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get api_key():String {
			return _api_key;	
		}
		
		/**
		 * Sets the API key that should be used to access the Facebook service.
		 *
		 * @param value The API key to use against Facebook.com
		 * @see http://developers.facebook.com/documentation.php?v=1.0&method=auth.getSession
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set api_key( value:String ):void {
			_api_key = value;	
		}
		
		/**
		 * Returns the "shared secret" of the Application associated with
		 * the API key for use in Authentication.
		 * 
		 * @see http://www.flickr.com/services/api/registered_keys.gne
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get secret():String {
			return _secret;	
		}
		
		/**
		 * Sets the "shared secret" to that of an Application configured against
		 * the API key for use in Authentication.
		 *
		 * @param value The "shared secret" of the Application to authenticate 
		 *			against.
		 * @see http://www.flickr.com/services/api/registered_keys.gne
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set secret( value:String ):void {
			_secret = value;	
		}
		
		/**
		 * Returns the token identifying the user as logged in
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get token():String {
			return _token;	
		}
		
		/**
		 * Sets the token identifyin the user as logged in so that
		 * the FlickrService API can sign the method calls correctly.
		 *
		 * @param value The authentication token
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set token( value:String ):void {
			_token = value;	
		}
		
		/**
		 * Returns the permission the application has for the
		 * currently logged in user's account.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get permission():String {
			return _permission;
		}
		
		/**
		 * Sets the desired permission for the user's account requested
		 * by the application.  During the login process, the user has
		 * the ability to allow or deny the application the permission.
		 *
		 * @param value One of the consants from the AuthPerm class
		 *			corresponding to the current permission the 
		 *			authenticated user has
		 * @see com.adobe.service.flickr.AuthPerm
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function set permission( value:String ):void {
			_permission = value;	
		}
		
		/**
		 * Provide read-only access to the Auth method group in the Facebook API
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get auth():Auth {
			return _auth;	
		}
		
//		/**
//		 * Provide read-only access to the Feed method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get feed():Feed {
//			return _feed;	
//		}
//		
//		/**
//		 * Provide read-only access to the Friends method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get friends():Feed {
//			return _friends;	
//		}
//		
//		/**
//		 * Provide read-only access to the Notifications method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get notifications():Notifications {
//			return _notifications;	
//		}
//
//		/**
//		 * Provide read-only access to the Profile method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get profile():Profile {
//			return _profile;	
//		}
//
//		/**
//		 * Provide read-only access to the Users method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get users():Users {
//			return _users;	
//		}
//
//		/**
//		 * Provide read-only access to the Events method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get events():Events {
//			return _events;	
//		}
//
//		/**
//		 * Provide read-only access to the Groups method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get groups():Groups {
//			return _groups;	
//		}
//
//		/**
//		 * Provide read-only access to the Photos method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get photos():Photos {
//			return _photos;	
//		}
//
//		/**
//		 * Provide read-only access to the Test method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get test():Test {
//			return _test;	
//		}
//
//		/**
//		 * Provide read-only access to the Urls method group in the Facebook API
//		 *
//		 * @langversion ActionScript 3.0
//		 * @playerversion Flash 8.5
//		 * @tiptext
//		 */
//		public function get urls():Urls {
//			return _urls;	
//		}

		/**
		 * Returns the URL to use for authentication so the developer
		 * doesn't have to build it by hand.
		 *
		 * @param frob The frob from flickr.auth.getFrob to authenticate with
		 * @param permission The permission the user will have after successful
		 *			login
		 * @return The url to open a browser to to authenticate against
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getLoginURL( frob:String, permission:String ):String {
			// TODO - change to suit facebook auth signature
			var sig:String = secret;
			sig += "api_key" + api_key;
			sig += "frob" + frob;
			sig += "perms" + permission;
			
			var auth_url:String = AUTH_END_POINT;
			auth_url += "api_key=" + api_key;
			auth_url += "&frob=" + frob;
			auth_url += "&perms=" + permission;
			auth_url += "&api_sig=" + MD5.hash( sig );
						
			return auth_url;
		}
		
		/**
		 * Use our "internal" namespace to provide access to the URLLoader
		 * from this class to the helper classes in the methodgroups package.
		 * This keeps this method away from the public API since it is not meant
		 * to be used by the public.
		 */
		facebookservice_internal function get urlLoader():URLLoader {
			return getURLLoader();	
		}
		
	}
	
}
