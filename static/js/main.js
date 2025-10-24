let orders=[];
function addToOrder(id,name,price)
{
    const qty= parseInt(document.getElementById(`qty_${id}`).value);
    const address=document.getElementById("address").value;
    orders.push({id:id,name:name,price:parseFloat(price),quantity:qty,address:address});
    
    alert(`${name} added x${qty}`);
}

document.getElementById("Placeorder").addEventListener("click",()=>
{
    fetch("/place_order",
        {
            method:'POST',
            headers:{"Content-Type":"application/json"},
            body:JSON.stringify({order:orders})
        }
    ).then(res => res.json())
    .then(data=>
    {
        localStorage.setItem("totalPrice",data.total);
        window.location.href="/payment_page"
    }
    )
})