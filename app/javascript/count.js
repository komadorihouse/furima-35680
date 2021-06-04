function count() {
  const price = document.getElementById("item-price");
  const innerfee = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit")

  price.addEventListener("input", () => {
    const fee = Math.floor(price.value*0.1);
    innerfee.innerHTML = `${Math.floor(price.value*0.1)}`;
    profit.innerHTML = `${price.value-fee}`;
  });
};


window.addEventListener('load', count);