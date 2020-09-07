window.addEventListener('DOMContentLoaded', function(){
  const price = document.getElementById("item-price");

  price.addEventListener("input", () => {
    const inputValue = document.getElementById("item-price").value;
    const tax = Math.floor(inputValue * 0.1).toLocaleString(); 
    const profit = Math.floor(inputValue * 0.9).toLocaleString();

    const addtaxprice = document.getElementById('add-tax-price');
    addtaxprice.textContent = tax;
   
    const addprofit = document.getElementById('profit');
    addprofit.textContent = profit;
  })
})