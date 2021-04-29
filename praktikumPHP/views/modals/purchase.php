<?php



?>
<div id="modalPurchase" class="modal">
    <div class="modal-content">
      <h4 class="center-align">Fill in the purchase form</h4>
        <div class="row">
          <form class="col s12">
            <div class="row">
              <div class="input-field col s12">
              <i class="material-icons prefix">contact_phone</i>
                <input id="tbPhoneNumber" type="text" class="validate">
                <label for="tbPhoneNumber">Phone number</label>
                <span class="helper-text">Numbers only.</span>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
              <i class="material-icons prefix">home</i>
                <input id="tbAddress" type="text">
                <label for="tbAddress">Your address</label>
                <span class="helper-text">City street and number</span>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
              <i class="material-icons prefix mt-2">credit_card</i>
              <p class="center-align">Payment method</p>
                    <select name="payment" id="paymentDdl" class="center-align">
                    </select>
                    <span></span>
                <span class="helper-text">How would you like to pay?</span>
              </div>
            </div>
             <div class="row" id="credit_card_number">
             
            </div>
          </form>
        </div>
    </div>
<div class="modal-footer">
      <a href="#!" id="ModelPurchaseConfirm" class="black-text">Confirm</a>
      <a href="#!" id="ModelPurchaseCancel" class="modal-close black-text">Cancel</a>
    </div>
</div>
