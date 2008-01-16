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
	
	import com.adobe.webapis.facebook.events.FacebookResultEvent;
	import com.adobe.webapis.facebook.*;
	import flash.events.Event;
	import flash.net.URLLoader;
	
		/**
		 * Broadcast as a result of the getInfo method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "pages_getInfo_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getInfo
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="pagesGetInfo", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the isAppAdded method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "pages_isAppAdded_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #isAppAdded
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="pagesIsAppAdded", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]

		/**
		 * Broadcast as a result of the isAdmin method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "pages_isAdmin_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #isAdmin
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="pagesIsAdmin", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]

		/**
		 * Broadcast as a result of the isFan method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "pages_isFan_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #isFan
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="pagesIsFan", 
			 type="com.adobe.webapis.facebook.events.FacebookResultEvent")]

	/**
	 * Contains the methods for the Pages method group in the Facebook API.
	 * 
	 * Even though the events are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Pages {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Pages "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Pages( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Returns all visible pages according to the filters specified. 
		 * This may be used to find all pages of which a user is a fan of, 
		 * or to query specific page_ids. The session_key parameter is optional. 
		 * When the session_key parameter is not passed, you can only get 
		 * information for pages that have been added your application. 
		 * The uid parameter is not even considered. With a session_key, 
		 * normal privacy rules are put into place.
		 * 
		 * @param fields List of desired fields in return. This is a comma-separated list of field strings.
		 * @param page_ids Optional - List of page ids. This is a comma_separated list of page ids.
		 * @param uid Optional - The id of the user. Defaults to the logged in user if the session_key is valid, AND no page_ids are passed. Used to get the pages a given user is a fan of
		 * @param type Optional - Used to limit results to a single type of page. Note that it only applies when the uid applies because it's not an indexable column of the page_fan table. If this parameter is passed without the page_id or uid parameter, it returns the pages the logged in user is a fan of of the given type. If this parameter is passed with the page_ids parameter WITHOUT a uid parameter, it's not considered. Passed with the uid parameter, it works as earlier stated with the uid substituted for the logged in user.
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=pages
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getInfo( fields:Array, page_ids:Array, uid:int = -1, type:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getInfo_result, 
									"facebook.pages.getInfo", 
									true,
									new NameValuePair( "fields", fields.toString() ),
									new NameValuePair( "page_ids", page_ids.toString() ),
									new NameValuePair( "uid", uid == -1 ? "" : uid.toString() ),
									new NameValuePair( "type", type.toString() )
									);
		}
		
		/**
		 * Capture the result of the getInfo call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getInfo_result( event:flash.events.Event ):void {
			// Create an PAGES_GET_INFO event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PAGES_GET_INFO );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "pages_getInfo_response",
												  MethodGroupHelper.parsePagesGetInfo );
		}
		
		/**
		 * Checks whether the page has added the application.
		 * 
		 * @param page_id (Optional) The id of the page
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=pages
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function isAppAdded( page_id:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, isAppAdded_result, 
									"facebook.pages.isAppAdded", 
									true,
									new NameValuePair( "page_id", page_id )
									);
		}
		
		/**
		 * Capture the result of the getInfo call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function isAppAdded_result( event:flash.events.Event ):void {
			// Create an PAGES_IS_APP_ADDED event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PAGES_IS_APP_ADDED );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "pages_isAppAdded_response",
												  MethodGroupHelper.parsePagesIsAppAdded );
		}

		/**
		 * Checks whether the logged in user is the admin for a given page.
		 * 
		 * @param page_id (Optional) The id of the page
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=pages
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function isAdmin( page_id:String = "" ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, isAdmin_result, 
									"facebook.pages.isAdmin", 
									true,
									new NameValuePair( "page_id", page_id )
									);
		}
		
		/**
		 * Capture the result of the isAdmin call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function isAdmin_result( event:flash.events.Event ):void {
			// Create an PAGES_IS_ADMIN event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PAGES_IS_ADMIN );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "pages_isAdmin_response",
												  MethodGroupHelper.parsePagesIsAdmin );
		}

		/**
		 * Checks whether a user is a fan of a given page.
		 * 
		 * @param page_id The id of the page to check.
		 * @param uid (Optional) The id of the user. Defaults to the logged in user if not set
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=pages
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function isFan( page_id:String = "", uid:int = -1 ):void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, isFan_result, 
									"facebook.pages.isFan", 
									true,
									new NameValuePair( "page_id", page_id ),
									new NameValuePair( "uid", ( uid == -1 ) ? "" : uid.toString() )
									);
		}
		
		/**
		 * Capture the result of the isAdmin call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function isFan_result( event:flash.events.Event ):void {
			// Create an PAGES_IS_FAN event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PAGES_IS_FAN );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "pages_isFan_response",
												  MethodGroupHelper.parsePagesIsFan );
		}

	}	
	
}