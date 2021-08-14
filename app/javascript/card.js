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
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);