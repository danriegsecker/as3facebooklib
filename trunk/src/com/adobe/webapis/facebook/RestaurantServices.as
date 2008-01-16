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
	
	/**
	 * RestaurantServices is a ValueObject for the Facebook API.
	 */
	public class RestaurantServices {
		
		private var _reserve:Boolean;
		private var _walkins:Boolean;
		private var _groups:Boolean;
		private var _kids:Boolean;
		private var _takeout:Boolean;
		private var _delivery:Boolean;
		private var _catering:Boolean;
		private var _waiter:Boolean;
		private var _outdoor:Boolean;
		
		/**
		 * Construct a new RestaurantServices instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function RestaurantServices() {
		}

		/**
		 * A boolean indicating whether reserve service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get reserve():Boolean {
			return _reserve;
		}
		
		public function set reserve( value:Boolean ):void {
			_reserve = value;
		}

		/**
		 * A boolean indicating whether walkins service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get walkins():Boolean {
			return _walkins;
		}
		
		public function set walkins( value:Boolean ):void {
			_walkins = value;
		}

		/**
		 * A boolean indicating whether groups service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get groups():Boolean {
			return _groups;
		}
		
		public function set groups( value:Boolean ):void {
			_groups = value;
		}

		/**
		 * A boolean indicating whether kids are allowed.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get kids():Boolean {
			return _kids;
		}
		
		public function set kids( value:Boolean ):void {
			_kids = value;
		}

		/**
		 * A boolean indicating whether takeout service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get takeout():Boolean {
			return _takeout;
		}
		
		public function set takeout( value:Boolean ):void {
			_takeout = value;
		}

		/**
		 * A boolean indicating whether delivery service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get delivery():Boolean {
			return _delivery;
		}
		
		public function set delivery( value:Boolean ):void {
			_delivery = value;
		}

		/**
		 * A boolean indicating whether catering service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get catering():Boolean {
			return _catering;
		}
		
		public function set catering( value:Boolean ):void {
			_catering = value;
		}

		/**
		 * A boolean indicating whether waiter service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get waiter():Boolean {
			return _waiter;
		}
		
		public function set waiter( value:Boolean ):void {
			_waiter = value;
		}

		/**
		 * A boolean indicating whether outdoor service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get outdoor():Boolean {
			return _outdoor;
		}
		
		public function set outdoor( value:Boolean ):void {
			_outdoor = value;
		}

	}
	
}