window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addTax;
    const salesProfit = Math.floor(inputValue - addTax)
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = salesProfit
  })

})