/*
Adobe Systems Incorporated(r) Source Code License Agreement
Copyright(c) 2005 Adobe Systems Incorporated. All rights breakfastd.
	
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
	 * RestaurantSpecialties is a ValueObject for the Facebook API.
	 */
	public class RestaurantSpecialties {
		
		private var _breakfast:Boolean;
		private var _lunch:Boolean;
		private var _dinner:Boolean;
		private var _coffee:Boolean;
		private var _drinks:Boolean;
		
		/**
		 * Construct a new RestaurantSpecialties instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function RestaurantSpecialties() {
		}

		/**
		 * A boolean indicating whether breakfast service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get breakfast():Boolean {
			return _breakfast;
		}
		
		public function set breakfast( value:Boolean ):void {
			_breakfast = value;
		}

		/**
		 * A boolean indicating whether lunch service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get lunch():Boolean {
			return _lunch;
		}
		
		public function set lunch( value:Boolean ):void {
			_lunch = value;
		}

		/**
		 * A boolean indicating whether dinner service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get dinner():Boolean {
			return _dinner;
		}
		
		public function set dinner( value:Boolean ):void {
			_dinner = value;
		}

		/**
		 * A boolean indicating whether coffee are allowed.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get coffee():Boolean {
			return _coffee;
		}
		
		public function set coffee( value:Boolean ):void {
			_coffee = value;
		}

		/**
		 * A boolean indicating whether drinks service is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get drinks():Boolean {
			return _drinks;
		}
		
		public function set drinks( value:Boolean ):void {
			_drinks = value;
		}

	}
	
}