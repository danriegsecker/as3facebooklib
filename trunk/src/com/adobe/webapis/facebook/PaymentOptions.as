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
	 * PaymentOptions is a ValueObject for the Facebook API.
	 */
	public class PaymentOptions {
		
		private var _cash_only:Boolean;
		private var _visa:Boolean;
		private var _amex:Boolean;
		private var _master_card:Boolean;
		private var _discover:Boolean;

		/**
		 * Construct a new PaymentOptions instance
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function PaymentOptions() {
		}	

		/**
		 * A boolean indicating whether cash_only payment option is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get cash_only():Boolean {
			return _cash_only;
		}
		
		public function set cash_only( value:Boolean ):void {
			_cash_only = value;
			if (_cash_only) {
				visa = false;
				amex = false;
				master_card = false;
				discover = false;
			}
		}

		/**
		 * A boolean indicating whether visa payment option is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get visa():Boolean {
			return _visa;
		}
		
		public function set visa( value:Boolean ):void {
			_visa = value;
		}

		/**
		 * A boolean indicating whether amex payment option is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get amex():Boolean {
			return _amex;
		}
		
		public function set amex( value:Boolean ):void {
			_amex = value;
		}

		/**
		 * A boolean indicating whether master card payment option is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get master_card():Boolean {
			return _master_card;
		}
		
		public function set master_card( value:Boolean ):void {
			_master_card = value;
		}

		/**
		 * A boolean indicating whether discover payment option is available.
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		public function get discover():Boolean {
			return _discover;
		}
		
		public function set discover( value:Boolean ):void {
			_discover = value;
		}

	}
	
}