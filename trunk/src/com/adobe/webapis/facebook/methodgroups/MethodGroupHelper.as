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

package com.adobe.webapis.facebook.methodgroups {
	
	import com.adobe.crypto.MD5;
	import com.adobe.webapis.facebook.*;
	import com.adobe.webapis.facebook.facebookservice_internal;
	import com.adobe.webapis.facebook.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.*;
	import flash.geom.Rectangle;
	import mx.utils.ObjectUtil;

	/**
	 * Contains helper functions for the method group classes that are
	 * reused throughout them.
	 */
	internal class MethodGroupHelper {
	
		internal static var facebook:Namespace = new Namespace("http://api.facebook.com/1.0/");

		/**
		 * Reusable method that the "method group" classes can call to invoke a
		 * method on the API.
		 *
		 * @param callBack The function to be notified when the RPC is complete
		 * @param method The name of the method to invoke ( like facebook.test.echo )
		 * @param signed A boolean value indicating if the method call needs
		 *			an api_sig attached to it
		 * @param params An array of NameValuePair or primitive elements to pass
		 *			as parameters to the remote method
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function invokeMethod( service:FacebookService, 
												callBack:Function, method:String, 
												signed:Boolean, ... params:Array ):void
		{
			
			// Create an array to store our name/value pairs
			// for the query because during signing we need to sort
			// these alphabetically
			var args:Array = new Array();
			
			args.push( new NameValuePair( "v", service.version ) );
			args.push( new NameValuePair( "method", method ) );
			args.push( new NameValuePair( "api_key", service.api_key ) );
			
			
			// Loop over the params and add them as arguments
			for ( var i:int = 0; i < params.length; i++ ) {
				// Do we have an argument name, or do we create one
				if ( params[i] is NameValuePair ) {
					args.push( params[i] );
				} else {
					// Create a unique argument name using our loop counter
					args.push( new NameValuePair( "param" + i, params[i].toString() ) );
				}
			}
			
			// If a user is authenticated, automatically add their auth_token
			if ( service.auth_token ) {
				args.push( new NameValuePair( "auth_token", service.auth_token ) );
				// auto-sign the call because the user is authenticated
				signed = true;
			}
			
			// Sign the call if we have to, or if the user is logged in
			if ( signed ) {
				
				// sign the call according to the documentation
				// here: http://developers.facebook.com/documentation.php?v=1.0&doc=auth
				
				/* FROM FACEBOOK:
				args = array of args to the request, formatted in arg=val pairs
				sorted_array = alphabetically_sort_array_by_keys(args);
				request_str = concatenate_in_order(sorted_array);
				signature = md5(concatenate(request_str, secret))
				*/
				
				args.sortOn( "name" );
				var sig:String = "";
				for ( var j:int = 0; j < args.length; j++ ) {
					sig += args[j].name.toString() + "=" + args[j].value.toString();	
				}
				sig += service.secret;
				args.push( new NameValuePair( "sig", MD5.hash( sig ) ) );
			}
			
			// Construct the query string to send to the Facebook service
			var query:String = "";
			for ( var k:int = 0; k < args.length; k++ ) {
				query += args[k].name + "=" + args[k].value
				if (k<args.length-1) query += "&";
			}
			
			// Use the "internal" facebookservice namespace to be able to
			// access the urlLoader so we can make the request.
			var loader:URLLoader = service.facebookservice_internal::urlLoader;

			trace("url:" + FacebookService.END_POINT + query)

			// Construct a url request with our query string and invoke
			// the Facebook method
			loader.addEventListener( "complete", callBack );
			loader.load( new URLRequest( FacebookService.END_POINT + query ) );
		}
		
		/**
		 * Handle processing the result of the API call.
		 *
		 * @param service The FacebookService associated with the method group
		 * @param response The XML response we got from the loader call
		 * @param result The event to fill in the details of and dispatch
		 * @param propertyName The property in event.data that the results should be placed
		 * @param parseFunction The function to parse the response XML with
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processAndDispatch( service:FacebookService, response:String, result:FacebookResultEvent, propertyName:String = "", parseFunction:Function = null ):void {
			
			trace("processAndDispatch1: response = " + response)
			
			// Process the response to create an object for return values
			var rsp:Object = processResponse( response, propertyName, parseFunction );

			trace("processAndDispatch2: rsp = " + ObjectUtil.toString( rsp ))
			// Copy some properties from the response to the result event
			result.success = rsp.success;
			result.data = rsp.data;
			
			// Notify everyone listening
			service.dispatchEvent( result );
		}
		
		/**
		 * Reusable method that the "method group" classes can call
		 * to process the results of the Facebook method.
		 *
		 * @param facebookResponse The rest response string that aligns
		 *		with the documentation here: 
		 *			http://developers.facebook.com/documentation.php?v=1.0
		 *			http://api.facebook.com/1.0/facebook.xsd
		 * @param parseFunction A reference to the function that should be used
		 *		to parse the XML received from the server
		 * @param propertyName The name of the property to put the parsed data in.
		 *  	For example, the result object will contain a "data" property that
		 * 		will contain an additional property (the value of propertyName) that
		 * 		contains the actual data.
		 * @return An object with success and data properties.  Success
		 *		will be true if the call was completed, false otherwise.
		 *		Data will contain ether an array of NameValuePair (if
		 *		successful) or errorCode and errorMessage properties.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processResponse( facebookResponse:String, propertyName:String, parseFunction:Function ):Object {

			var result:Object = new Object();
			result.data = new Object();
			
			// Use an XMLDocument to convert a string to XML
			var doc:XMLDocument = new XMLDocument();
			doc.ignoreWhite = true;
			doc.parseXML( facebookResponse );
			
			trace("processResponse: doc = "+doc.toString());

			// Get the root rsp node from the document
			var rsp:XMLNode = doc.firstChild;
			
			// Clean up a little
			doc = null; 
			
			if ( rsp.nodeName != "error_response" ) {
				result.success = true;
				
				// Parse the XML object into a user-defined class (This gives us
				// nice code hinting, and abstracts away the FacebookAPI a bit - if
				// the FacebookAPI changes responses we can modify this service
				// without the user having to update their program code
				if ( parseFunction == null ) {
					// No parse function speficied, just pass through the XML data.
					// Construct an object that we can access via E4X since
					// the result we get back from Facebook is an xml response
					result.data = XML( rsp );
				} else {
					result.data[propertyName] = parseFunction( XML( rsp ) );	
				}			
								
			} else {
				result.success = false;
				
				
				// In the event that we don't get an xml object
				// as part of the error returned, just
				// use the plain text as the error message
				
				var error:FacebookError = new FacebookError();
				if ( rsp.firstChild != null ) 
				{
					error.errorCode = int( rsp.firstChild.attributes.error_code );
					error.errorMessage = rsp.firstChild.attributes.error_msg;
					
					result.data.error = error;
				}
				else 
				{
					error.errorCode = -1;
					error.errorMessage = rsp.nodeValue;
					
					result.data.error = error;
				}
				
			}
			
			
			return result;			
		}
		
		/**
		 * Converts a date object into a Facebook date string
		 *
		 * @param date The date to convert
		 * @return A string representing the date in a format
		 *		that Facebook understands
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function dateToString( date:Date ):String {
			// Don't do anything if the date is invalid
			if ( date == null ) {
				return "";
			} else {
				return date.getFullYear() + "-" + (date.getMonth() + 1)
					+ "-" + date.getDate() + " " + date.getHours()
					+ ":" + date.getMinutes() + ":" + date.getSeconds();
			}
		}
		
		/**
		 * Converts a Facebook date string into a date object
		 *
		 * @param date The string to convert
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function stringToDate( str:String = "" ):Date {
			if ( str == "" ) {
				return null;
			}
			
			var date:Date = new Date();
			// split the date into date / time parts
			var parts:Array = str.split( " " );
			
			// See if we have the xxxx-xx-xx xx:xx:xx format
			if ( parts.length == 2 ) {
				var dateParts:Array = parts[0].split( "-" );
				var timeParts:Array = parts[1].split( ":" );
				
				date.setFullYear( dateParts[0] );
				date.setMonth( dateParts[1] - 1 ); // subtract 1 (Jan == 0)
				date.setDate( dateParts[2] );
				date.setHours( timeParts[0] );
				date.setMinutes( timeParts[1] );
				date.setSeconds( timeParts[2] );
			} else {
				// Create a date based on # of seconds since Jan 1, 1970 GMT
				date.setTime( parseInt( str ) * 1000 );
			}
			
			return date;
		}
		
		/**
		 * Converts an auth_getSession XML object into an AuthSession instance
		 */
		internal static function parseAuthSessionResult( xml:XML ):AuthSession {
			var authSession:AuthSession = new AuthSession();
			authSession.session_key = xml.facebook::session_key.toString();
			authSession.uid = xml.facebook::uid.toString();
			authSession.expires = xml.facebook::expires.toString();
			authSession.secret = xml.facebook::secret.toString();
			return authSession;
		}
		
		/**
		 * Converts a auth_createToken XML object into a string (the auth_token value)
		 */
		internal static function parseAuthToken( xml:XML ):String {
			trace("parseAuthToken: xml = " + xml)
			return xml.toString();
		}
		
		/**
		 * Converts a photos_addTag XML object into a string (the photos_addTag value)
		 */
		internal static function parsePhotosAddTag( xml:XML ):String {
			return xml.photos_addTag_response.toString();
		}
		
		/**
		 * Converts a photos_createAlbum XML object into a string (the photos_createAlbum value)
		 */
		internal static function parsePhotosCreateAlbum( xml:XML ):String {
			return xml.photos_createAlbum_response.toString();
		}
		
		/**
		 * Converts a photos_get XML object into an array of Photo instances
		 */
		internal static function parsePhotosList( xml:XML ):Array {
			
			var photos:Array = new Array();
			
			for each ( var p:XML in xml.photo ) {
				var photo:Photo = new Photo();
				photo.pid = parseInt( p.facebook::pid );
				photo.aid = parseInt( p.facebook::aid );
				photo.owner = parseInt( p.facebook::owner );
				photo.src = p.facebook::src.toString();
				photo.src_big = p.facebook::src_big.toString();
				photo.src_small = p.facebook::src_small.toString();
				photo.link = p.facebook::link.toString();
				photo.caption = p.facebook::caption.toString();
				photo.created = stringToDate( p.facebook::created.toString() );
				
				photos.push( photo );
			}
			
			return photos;
		}
		
		/**
		 * Converts a photos_getAlbums XML object into a string (the photos_getAlbums value)
		 */
		internal static function parsePhotosGetAlbums( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a photos_getTags XML object into a string (the photos_getTags value)
		 */
		internal static function parsePhotosGetTags( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a photos_upload XML object into a string (the photos_upload value)
		 */
		internal static function parsePhotosUpload( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a groups_get XML object into a string (the groups_get value)
		 */
		internal static function parseGroupsGet( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a groups_getMembers XML object into a string (the groups_getMembers value)
		 */
		internal static function parseGroupsGetMembers( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a users_getInfo XML object into a string (the users_getInfo value)
		 */
		internal static function parseUsersGetInfo( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a users_getLoggedInUser XML object into a string (the users_getLoggedInUser value)
		 */
		internal static function parseUsersGetLoggedInUser( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a fbml_refreshImgSrc XML object into a string (the fbml_refreshImgSrc value)
		 */
		internal static function parseFbmlRefreshImgSrc( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a fbml_refreshRefUrl XML object into a string (the fbml_refreshRefUrl value)
		 */
		internal static function parseFbmlRefreshRefUrl( xml:XML ):String {
			return xml.fbml_refreshRefUrl_response.toString();
		}
		
		/**
		 * Converts a fbml_setRefHandle XML object into a string (the fbml_setRefHandle value)
		 */
		internal static function parseFbmlSetRefHandle( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a feed_publishStoryToUser XML object into a string (the feed_publishStoryToUser value)
		 */
		internal static function parseFeedPublishStoryToUser( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a feed_publishActionOfUser XML object into a string (the feed_publishActionOfUser value)
		 */
		internal static function parseFeedPublishActionOfUser( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a events_get XML object into a string (the events_get value)
		 */
		internal static function parseEventsGet( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a events_getMembers XML object into a string (the events_getMembers value)
		 */
		internal static function parseEventsGetMembers( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a notifications_get XML object into a string (the notifications_get value)
		 */
		internal static function parseNotificationsGet( xml:XML ):String {
			return xml.toString();
		}
		
		/**
		 * Converts a notifications_send XML object into a string (the notifications_send value)
		 */
		internal static function parseNotificationsSend( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a notifications_sendRequest XML object into a string (the notifications_sendRequest value)
		 */
		internal static function parseNotificationsSendRequest( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a profile_setFBML XML object into a string (the profile_setFBML value)
		 */
		internal static function parseProfileSetFBML( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a profile_getFBML XML object into a string (the profile_getFBML value)
		 */
		internal static function parseProfileGetFBML( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a friends_areFriends XML object into a string (the friends_areFriends value)
		 */
		internal static function parseFriendsAreFriends( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a friends_get XML object into a string (the friends_get value)
		 */
		internal static function parseFriendsGet( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a friends_getAppUsers XML object into a string (the friends_getAppUsers value)
		 */
		internal static function parseFriendsGetAppUsers( xml:XML ):String {
			return xml.toString();
		}

		/**
		 * Converts a fql_query XML object into a string (the fql_query value)
		 */
		internal static function parseFqlQuery( xml:XML ):String {
			return xml.toString();
		}

	}
	
}