const pay = () => {
  Payjp.setPublickey("pk_test_0f65827a34b2010c106c9930");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FromData(formResult);

    const card = {
      number: formData.get("buyer_destination[number]"),
      exp_month: formData.get("buyer_destination[exp_month]"),
      exp_year: `20${formData.get("buyer_destination[exp_year]")}`,
      cvc: formData.get("buyer_destination[cvc]"),
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("buyer_destination[number]").removeAttribute("name");
      document.getElementById("buyer_destination[exp_month]").removeAttribute("name");
      document.getElementById("buyer_destination[exp_year]").removeAttribute("name");
      document.getElementById("buyer_destination[cvc]").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);