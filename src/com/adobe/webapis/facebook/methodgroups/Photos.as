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

package com.adobe.webapis.facebook.methodphotos {
	
	import com.adobe.webapis.facebook.photos.FacebookResultEvent;
	import com.adobe.webapis.facebook.*;
	import flash.photos.Event;
	import flash.net.URLLoader;
	
		/**
		 * Broadcast as a result of the addTag method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_addTag_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #addTag
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosAddTag", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the createAlbum method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_createAlbum_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #createAlbum
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosCreateAlbum", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the get method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #get
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosGet", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getAlbums method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getAlbums
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosGetAlbums", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
		/**
		 * Broadcast as a result of the getTags method being called
		 *
		 * The event contains the following properties
		 *	success	- Boolean indicating if the call was successful or not
		 *	data - When success is true, contains a "photos_get_response" string
		 *		   When success is false, contains an "error" FacebookError instance
		 *
		 * @see #getTags
		 * @see com.adobe.service.facebook.FacebookError
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		[Event(name="photosGetTags", 
			 type="com.adobe.webapis.facebook.photos.FacebookResultEvent")]
	
	/**
	 * Contains the methods for the Photos method group in the Facebook API.
	 * 
	 * Even though the photos are listed here, they're really broadcast
	 * from the FacebookService instance itself to make using the service
	 * easier.
	 */
	public class Photos {
			 
		/** 
		 * A reference to the FacebookService that contains the api key
		 * and logic for processing API calls/responses
		 */
		private var _service:FacebookService;
	
		/**
		 * Construct a new Photos "method group" class
		 *
		 * @param service The FacebookService this method group
		 *		is associated with.
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function Photos( service:FacebookService ) {
			_service = service;
		}
		
		/**
		 * Adds a tag with the given information to a photo. See photo uploads for a 
		 * description of the upload workflow.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function addTag():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, addTag_result, "facebook.photos.addTag", true );
		}
		
		/**
		 * Capture the result of the addTag call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function addTag_result( event:Event ):void {
			// Create an PHOTOS_ADD_TAG event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_ADD_TAG );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_addTag_response",
												  MethodGroupHelper.parsePhotosAddTag );
		}
		
		/**
		 * Creates and returns a new album owned by the current session user. See photo uploads for a 
		 * description of the upload workflow. The only storable values returned from this call are 
		 * aid and owner.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function createAlbum():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, createAlbum_result, "facebook.photos.createAlbum", true );
		}
		
		/**
		 * Capture the result of the createAlbum call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function createAlbum_result( event:Event ):void {
			// Create an PHOTOS_CREATE_ALBUM event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_CREATE_ALBUM );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_createAlbum_response",
												  MethodGroupHelper.parsePhotosCreateAlbum );
		}
		
		/**
		 * Returns all visible photos according to the filters specified. This may be used 
		 * to find all photos of a user, or to query specific eids.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, get_result, "facebook.photos.get", true );
		}
		
		/**
		 * Capture the result of the get call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function get_result( event:Event ):void {
			// Create an PHOTOS_GET event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_get_response",
												  MethodGroupHelper.parsePhotosGet );
		}
		
		/**
		 * Returns membership list data associated with an event.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getAlbums():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getAlbums_result, "facebook.photos.getAlbums", true );
		}
		
		/**
		 * Capture the result of the getAlbums call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getAlbums_result( event:Event ):void {
			// Create an PHOTOS_GET_MEMBERS event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET_MEMBERS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_getAlbums_response",
												  MethodGroupHelper.parsePhotosGetAlbums );
		}
		
		/**
		 * Returns membership list data associated with an event.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function getTags():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, getTags_result, "facebook.photos.getTags", true );
		}
		
		/**
		 * Capture the result of the getTags call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function getTags_result( event:Event ):void {
			// Create an PHOTOS_GET_TAGS event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET_TAGS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_getTags_response",
												  MethodGroupHelper.parsePhotosGetTags );
		}
		
		/**
		 * Uploads a photo owned by the current session user and returns the new photo. 
		 * See photo uploads for a description of the upload workflow. The only storable 
		 * values returned from this call are pid, aid, and owner.
		 * 
		 * @see http://developers.facebook.com/documentation.php?v=1.0&doc=photos
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function upload():void {
			// Let the Helper do the work to invoke the method			
			MethodGroupHelper.invokeMethod( _service, upload_result, "facebook.photos.upload", true );
		}
		
		/**
		 * Capture the result of the upload call, and dispatch
		 * the event to anyone listening.
		 *
		 * @param event The complete event generated by the URLLoader
		 * 			that was used to communicate with the Facebook API
		 *			from the invokeMethod method in MethodGroupHelper
		 */
		private function upload_result( event:Event ):void {
			// Create an PHOTOS_UPLOAD event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_UPLOAD );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( _service, 
												  URLLoader( event.target ).data, 
												  result,
												  "photos_upload_response",
												  MethodGroupHelper.parsePhotosUpload );
		}

	}	
	
}